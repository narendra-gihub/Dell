public class N_DataController{
    @AuraEnabled(cacheable=true)
    public static List <Account> fetchRecords() {
        List<Account> accList = [SELECT Id, Name,Website,Phone,Industry from Account];
        return accList;
    }
}