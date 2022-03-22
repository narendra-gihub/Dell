public with sharing class CustomHelper {
    public static void GetCustomer(list<Customers__c> custList){
        for(Customers__c cust:custList){
            if(cust.Income__c>=100000){
                cust.Tax_Deductions__c='15%';
            }
        }
    }
}