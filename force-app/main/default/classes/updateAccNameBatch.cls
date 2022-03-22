global class updateAccNameBatch implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {    
        String res = 'select id,name from account';
        return Database.getQueryLocator(res);
    }
    
    global void execute(Database.BatchableContext BC, List<Account> accList) {
        for(Account acc : accList)
        {        
            acc.Name= acc.Name + 'Sir';
        }
        update accList;   
    }
    
    global void finish(Database.BatchableContext BC) {
            // sending notifications
    }
}