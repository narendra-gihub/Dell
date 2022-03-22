trigger CreateOrder on Opportunity (before insert,before delete,after update) {
    if(trigger.isBefore){
        if(trigger.isInsert){
            for(opportunity opp:trigger.new){
                if(opp.StageName!='prospecting'){
                    opp.StageName.addError('stage should be prospecting');
                }
            }
        }
        
        if(trigger.isDelete){
            for(opportunity op:trigger.old){
                if(op.StageName=='Closed Won'){
                    op.addError('You can not delete the record');
                }
            }
        }
        
    }
    
    if(trigger.isAfter && trigger.isUpdate){
        for(opportunity opp:trigger.new){
            if(opp.StageName=='Closed Won'){
                Order ord = new order();
                ord.AccountId=opp.AccountId;
                ord.Status='Draft';
                ord.EffectiveDate=opp.CloseDate;
            } 
        }
    }
    
    
}