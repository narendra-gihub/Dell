public class CustomerController {    
    @AuraEnabled
    public static list<Customers__c> getcustomers(){      
        return [select name, Email__c,Phone__c,Income__c from Customers__c];                     
    } 
    @AuraEnabled
    public static void updateCustomer(string name,id recordId, string phone,decimal income){      
        Customers__c cust = [select id,name,phone__c,email__c from Customers__c where id=:recordId];
        cust.id=recordId;
        cust.Name=name;
        cust.Phone__c=phone;
        cust.Income__c=income; 
        if (Schema.sObjectType.Customers__c.fields.Phone__c.isUpdateable()) {
            update cust;
        }
    } 
}