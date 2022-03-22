trigger OpportunityTrigger on Opportunity (before delete, after update) {
    
    if(trigger.isDelete){      
        for(opportunity opp:trigger.old){
            if(opp.StageName=='Qualification'){
                opp.addError('We can not remove the opportunity which is already in qualification stage');
            }
        }
    }
     
    if(trigger.isUpdate){
       list<case> caseList = new list<case>();
        for(opportunity opp:trigger.new){
            if(opp.StageName=='Closed Lost'){
                case cs = new case();
                cs.AccountId=opp.AccountId;
                cs.Opportunity__c=opp.id;
                cs.Status='New';
                cs.Priority='Priority';
                cs.Origin='Web';
                cs.Subject='Case Created from Trigger';
                cs.Description='Opportunity is closed lost';
                //insert cs;
                caseList.add(cs);
            }
        }insert caseList;
    }
}