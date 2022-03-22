trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) {
	list<BatchLeadConvertErrors__c> listErrEvt = new list<BatchLeadConvertErrors__c>();
    for(BatchApexErrorEvent bevnt : trigger.new){
        BatchLeadConvertErrors__c bctchCon = new BatchLeadConvertErrors__c();
        bctchCon.AsyncApexJobId__c=bevnt.AsyncApexJobId;
        bctchCon.Records__c=bevnt.JobScope;
        bctchCon.StackTrace__c=bevnt.StackTrace;
        listErrEvt.add(bctchCon);
    }
    insert listErrEvt;
}