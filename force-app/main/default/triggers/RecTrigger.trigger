trigger RecTrigger on Contact(after Update) {
    Set<String> accIdSet = new Set<String>();
    if(RecursiveTriggerHandler.isFirstTime){
        RecursiveTriggerHandler.isFirstTime = false;
        for(Contact conObj : Trigger.New){
            if(conObj.LeadSource != 'Web'){
                accIdSet.add(conObj.accountId);
            }
        }
    }
}