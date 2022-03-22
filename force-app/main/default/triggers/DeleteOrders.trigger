trigger DeleteOrders on Customers__c (before delete) {
    list<Id> custIDlist = new list<Id>();
    for(Customers__c cust:trigger.old){
        custIDlist.add(cust.Id);  
    }    
    list<Orders__c> ordlist = [select id,Product__c from Orders__c where Customers__c in:custIDlist];
    delete ordlist;
}