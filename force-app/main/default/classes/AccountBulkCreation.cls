global class AccountBulkCreation implements Database.batchable<sObject>{ 
    public String query;
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(Query); 
    }   
    global void execute(Database.BatchableContext info, List<Account> scope){
        list<account> acclist = new list<account>();
        for(integer i=0;i<100;i++){
            Account acc = new Account();
            acc.name = 'Account'+i;
            System.debug('accName'+acc.name);
            //acc.ParentId=acc[0].id; 
            acclist.Add(acc);
        }
        insert acclist;
    }     
    global void finish(Database.BatchableContext info){     
    } 
}