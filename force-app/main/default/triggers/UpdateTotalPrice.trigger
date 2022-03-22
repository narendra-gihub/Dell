trigger UpdateTotalPrice on OpportunityLineItem (after insert,after update,after delete,after undelete) {
/*    set<id> oppId = new set<id>();
    list<opportunity> oppList = new list<opportunity>();
    if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete){
        for(OpportunityLineItem opLI:trigger.new){
            oppId.add(opLI.OpportunityId );
        }	
    }
    if(trigger.isInsert){
        for(OpportunityLineItem opLI:trigger.old){
            oppId.add(opLI.OpportunityId );
        }	
    }
    map<id,Opportunity> oppLIMap = new map<id,Opportunity>(
                                                        [SELECT Id,Total_Price__c,
                                                         (SELECT Id, OpportunityId, Price__c FROM OpportunityLineItem)
                                                         from Opportunity 
                                                         where Id IN : oppId]
    								); 
    decimal basicVal = 0;
    for(OpportunityLineItem oppLI:trigger.new){
        Opportunity Currentopp = oppLIMap.get(oppLI.OpportunityId);
        for(OpportunityLineItem OpLI:Currentopp.OpportunityLineItem){
            if(OpLI.Price__c>basicVal)basicVal=oppLI.Price__c;
        }
        Currentopp.Total_Price__c=OpLI.Price__c;
    }*/
}