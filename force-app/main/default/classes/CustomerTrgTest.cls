@isTest
public class CustomerTrgTest {
    @isTest
    public static void updateTax(){
       	//Create test data
        Customers__c cust = new Customers__c();
        cust.name='TestCustomer';
        cust.Income__c=2000000;
        cust.Tax_Deductions__c='5%'; 
        insert cust;   
        cust=[select id,name,income__c,Tax_Deductions__c from Customers__c where id=:cust.Id]; 
    }
    
    @isTest
    public static void CustActivate(){
        Customers__c cust = new Customers__c();
        cust.name='TestCustomer';
        cust.Active__c=True;
        insert cust;
    }
}