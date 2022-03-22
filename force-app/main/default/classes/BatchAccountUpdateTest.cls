@isTest
private class BatchAccountUpdateTest {
    static testmethod void test() {
        // Create test accounts to be updated by batch
        list<Account> accList = new list<Account>();
        for (Integer i=0;i<200;i++) {
            Account ac = new Account(Name = 'Account' + i);
            accList.add(ac);
        }
        insert accList;
        
        Test.startTest();
        BatchAccountUpdate b = new BatchAccountUpdate();
        Database.executeBatch(b);
        Test.stopTest();
        // Verify accounts updated
        Account[] accUpdatedList = [SELECT Id, Name FROM Account];
        System.assert(accUpdatedList[0].Name.Contains('SF'));             
    }
}