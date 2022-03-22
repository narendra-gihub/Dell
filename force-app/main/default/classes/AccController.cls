public class AccController{
    @AuraEnabled
    public static List <Account> fetchAccounts() {
            List<Account> accList = [SELECT Id, Name, BillingState,Website, Phone, Industry, Type from Account LIMIT 10];
            return accList;
    }
}