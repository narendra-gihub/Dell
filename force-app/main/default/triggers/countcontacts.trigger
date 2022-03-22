trigger countcontacts on Contact (after insert, after delete) {
    Set<Id> aId = new Set<Id>();
    if(Trigger.isInsert){
        System.debug('Insert contact for trigger.new - '+Trigger.New);
        for(Contact opp : Trigger.New){
            aId.add(opp.AccountId);
        }
        List<Account> acc = [select id,No_Of_Contacts__c from Account where Id in:aId];
        List<Contact> con = [select id from contact where AccountId in :aId];
        for(Account a : acc){
            a.No_Of_Contacts__c=con.size();
        }
        update acc;
        System.debug('Number is '+acc);
    }
    
    if(Trigger.isDelete){
        System.debug('delete contact for trigger.old - '+Trigger.Old);
        for(Contact opp : Trigger.old){
            aId.add(opp.AccountId);
        }
        List<Account> acc = [select id,No_Of_Contacts__c from Account where Id in:aId];
        List<Contact> con = [select id from contact where AccountId in :aId];
        for(Account a : acc){
            a.No_Of_Contacts__c=con.size();
        }
        update acc;
        System.debug('Number is '+acc);
    }
}