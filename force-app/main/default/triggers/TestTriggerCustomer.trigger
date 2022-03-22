trigger TestTriggerCustomer on Customers__c (before insert) {
    for(customers__c cust:trigger.new){
        if(cust.Income__c <= 100000){
            cust.addError('Income should be one lakh Trigger');
        }
    }
}