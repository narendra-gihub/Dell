trigger DellModelTrigger on DellModels__c (before insert,before update,before delete,after insert,after update,after delete,after undelete) {
    if(trigger.isBefore && trigger.isDelete){
        for(DellModels__c dm:trigger.old){
            if(dm.IsExpired__c==false){
                dm.IsExpired__c.addError('You can not delete current model');
            }
        }
    }
    if(trigger.isafter && (trigger.isInsert)){
        list<case> caselist = new list<case>();
        for(DellModels__c dm:trigger.new){
            if(dm.BasicPrice__c>=2000){
                case cs = new case();
                cs.Status='New';
                cs.Origin='Web';
                cs.Priority='High';
                cs.Description='Invalid amount added to the current model. Please verity and make it change';
                caselist.add(cs);    
            }
        }insert caselist; 
    }
}