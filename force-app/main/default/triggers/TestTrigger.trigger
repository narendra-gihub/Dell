trigger TestTrigger on Customers__c (before insert,before update,before delete,after insert,after update,after delete,after undelete) {
    if(trigger.isBefore && trigger.isInsert){
        for(Customers__c cust:trigger.new){
            if(cust.Income__c<100000){
                cust.Tax_Deductions__c='5%';
            }
        }  
    }
}