public class SObjectsController {
    @auraEnabled
    public static list<contact> getContacts(id accId){
        return[select id,lastname,email from contact where accountid=:accId];
    }
}