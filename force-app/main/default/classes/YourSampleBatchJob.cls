public with sharing class YourSampleBatchJob implements
Database.Batchable<SObject>, Database.RaisesPlatformEvents {
    public Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id,Name FROM Account';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext BC, List<Account> scope) {
        for(Account a : scope)
        {
            a.Name = a.Name + 'Added';            
        }
        update scope;
    }   
    
    public void finish(Database.BatchableContext BC) {
    }
}