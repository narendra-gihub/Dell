global class BatchAccountUpdate implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id,Name FROM Account where createddate=today';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Account> accList) {
        for(Account a : accList) {
            a.Name = a.Name + ' SF';
        }
        update accList;
    }
    
    global void finish(Database.BatchableContext BC) {
        //Send Notifications
    }
}