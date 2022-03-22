@isTest
public class OppHelperControllerTest {
	@isTest
    public static void testCreation(){
        account acc = new account();
        acc.Name='testAccount123';
        insert acc;
        
        opportunity opp = new opportunity();
        opp.AccountId=acc.Id;
        opp.StageName='CLosed Won';
        opp.CloseDate=date.today();
        opp.Name='TestOpp123';
        //opp.c=contr.Id;
        insert opp;
        
        list<opportunity> oppList = new list<opportunity>{opp};
        
        OppHelperController opphlpr = new OppHelperController();
        opphlpr.createOrder(oppList);
    }
}