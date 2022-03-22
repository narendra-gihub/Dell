public with sharing class caseCreationController {

    @AuraEnabled
    public static Case saveCase(String caseJSON) {

        Case newCase = (Case)JSON.deserialize(caseJSON, Case.class);
        insert newcase;
        return newcase;
    }
}