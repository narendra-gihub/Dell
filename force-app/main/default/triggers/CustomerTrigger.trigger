// Updating active field
// Creation History: Narendra       Date: 01-06-2020
// Modification History: 
trigger CustomerTrigger on Customers__c (before insert, before update, after insert, after update, after undelete) {
    if(trigger.isBefore){
        for(Customers__c cust:trigger.new){
            if(cust.Income__c>=100000){
                cust.Tax_Deductions__c='15%';
            }
        }
    }
    
    if(trigger.isAfter){
        list<Customers__c> updateLst = new list<Customers__c>();
        for(Customers__c cust: trigger.new){
            if(cust.Active__c==true){
                list<Customers__c> custList = [select id,active__c from customers__c where id!=:cust.Id];
                system.debug('listSize----->'+custList.size());
                for(Customers__c cst:custList){
                    cst.Active__c=false;
                    updateLst.add(cst);
                }
                update updateLst;
            }
        }   
    }
}