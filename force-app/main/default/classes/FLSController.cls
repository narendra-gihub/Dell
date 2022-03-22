public with sharing class FLSController {
    
    @AuraEnabled
    public static void GetAccounts() {
        list<account> accUpdateList = new list<account>();
        list<account> acclist=[select id,name,type from account];
        
        if(Schema.SObjectType.Account.fields.Type.isUpdateable()) {
            
            for(account a:acclist){
                
                a.type='Prospect';
                accUpdateList.add(a);
            }
            update accUpdateList;
        }else{
            //Fields Accessibility
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Error: Insufficient Access'));
            
        }
    }
}