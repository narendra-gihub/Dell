public with sharing class AccountDetailsController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactsList(string recordId) {
        System.debug('recordid--->'+recordId);
        return [SELECT Id, Name, Phone, Fax, Email, LeadSource, Department FROM Contact where accountid=:recordId];
    }
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunitiesList(string recordId) {
        System.debug('recordid--->'+recordId);
        return [SELECT Id, Name, StageName, Amount, Type, LeadSource FROM Opportunity where accountid=:recordId];
    }
    @AuraEnabled(cacheable=true)
    public static List<product2> getContactList() {
        //System.debug('recordid--->'+recordId);
        return [SELECT Id, Name FROM product2];
    }
}