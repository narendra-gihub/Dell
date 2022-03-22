public class DellModelController {
    public static list<DellModels__c> getDellModels(string recId){
        list<DellModels__c> dmList = new list<DellModels__c>();
        dmList=[SELECT Id, Name, IsExpired__c, Made_In__c, States__c, BasicPrice__c FROM DellModels__c where id=:recId];
        return dmList; 
    }
    public static void updateDellModels(){
        list<DellModels__c> dmList = new list<DellModels__c>();
        for(DellModels__c dm:[SELECT Id, Name, IsExpired__c, Made_In__c, States__c, BasicPrice__c FROM DellModels__c]){
            if(dm.States__c=='India'){
                dm.BasicPrice__c=500;
                dmList.add(dm);
            } 
        } update dmList;
    }
}