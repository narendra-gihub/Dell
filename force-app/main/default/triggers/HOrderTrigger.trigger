trigger HOrderTrigger on HOrders__c(after insert, after update, after undelete) {
    
    if(trigger.isAfter && (trigger.isInsert || trigger.isUpdate || trigger.isUndelete)){
        list<HOrders__c> rdst = new list<HOrders__c>();
        
        for(HOrders__c ord:trigger.new)
        {
            list<HOrders__c> rdLst = [select id,Active__c from HOrders__c where id!=:ord.Id];
            
            if(ord.active__c==true){
                for(HOrders__c rd:rdLst){
                    if(rd.active__c==true){
                        rd.active__c=false;
                    }
                    rdst.add(rd);
                }
                update rdst;
                //ord.Stage__c='Pending';
            }
        }
    }
}