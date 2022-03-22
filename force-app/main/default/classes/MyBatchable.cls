public class MyBatchable implements Database.Batchable<SObject> { 
    public Database.QueryLocator start(Database.BatchableContext context) { 
        return Database.getQueryLocator([select Id from Account order by Name]); 
    } 
    public void execute(Database.BatchableContext context, List<Account> scope) {
        Account[] updates = new Account[] {}; 
            for (AggregateResult ar : [ select AccountId a, count(Id) c from Contact where AccountId in :scope group by AccountId ]) { 
                updates.add(new Account( Id = (Id) ar.get('a'), No_of_Contacts__c = (Decimal) ar.get('c') )); 
            } 
        update updates; 
    } 
    public void finish(Database.BatchableContext context) { 
    } 
}