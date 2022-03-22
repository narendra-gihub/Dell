@isTest
public class DellModelTriggerTest {    
    @isTest
    public static void dellModelTest(){
        TestDataFactory.processDellModels();
        list<case> cs = [select id,status,description from case where createddate=today limit 1];
        system.assertEquals(1, cs.size());
    }
}