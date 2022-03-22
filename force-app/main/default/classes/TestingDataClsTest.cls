@isTest
private class TestingDataClsTest {
    static testMethod void updatevals(){
        account acc = new account(name='TestCls',phone='8096143883');
        system.debug('Values are'+acc.name); 
        
        test.startTest();
        	insert acc;
        test.stopTest();
        

    }
}