trigger CustomerTrg on Customers__c (before insert,before update) {
    for(Customers__c cust:trigger.new){
        if(cust.Income__c>=100000){
            cust.Tax_Deductions__c='15%';
        }
    }
}