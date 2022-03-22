global class N_StatefulBatchApex implements Database.Batchable<sObject>, Database.Stateful{
    
    global integer numberofDirectCustomers = 0;
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        String soqlQuery = 'SELECT Name, AccountNumber, Type From Account';
        return Database.getQueryLocator(soqlQuery);
    }
    
    global void execute(Database.BatchableContext bc, List<Account> scope){
        
        for (Account acc : scope){
            if(acc.Type.equals('Customer - Direct')){
                numberofDirectCustomers++;
            }
        }
        // Calling another batch class
        batchExample bt = new batchExample();
        database.executeBatch(bt, 200);
    }
    
    global void finish(Database.BatchableContext bc){
        // Sending Mail
        messaging.SingleEmailMessage ms=New messaging.SingleEmailMessage();
        string[] mailme=new string[]{'narendra.vatala@gmail.com'};
        ms.settoAddresses(mailme); 
        ms.setsubject ('record update');
        ms.setPlainTextBody('ExampleText');
        messaging.sendEmail(new messaging.SingleEmailMessage[]{ms});
        
        // Calling another batch class
        batchExample bt = new batchExample();
        database.executeBatch(bt, 200);
    }
}