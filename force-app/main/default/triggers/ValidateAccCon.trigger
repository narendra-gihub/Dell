trigger ValidateAccCon on Lead (before insert,before update,after insert,after update) {
    //try{
    /*
    set<id> accId = new set<id>();
    set<id> conId = new set<id>();
    for(lead ld:trigger.new){
        accId.add(ld.account__c);
        conId.add(ld.contact__c);
    }
    
    account acc=[select id,name from account where id IN:accId];
    contact con=[select id,name,accountId from contact where id IN:conId];
    list<contact> con2=[select id,name,accountId from contact where id IN:conId AND accountId=null];
    
    if(trigger.isBefore){
        for(lead ld:trigger.new){
            if(ld.Account__c!=con.AccountId){
                ld.addError('Account and Contact should be match'); 
            }
        }
    }
     
    if(trigger.isAfter){
        list<lead> ldList = new list<lead>();
        for(lead l:trigger.new){
            if((l.Contact__c!=null && l.Account__c==null) || (l.Contact__c!=null && con2.size()>0)){
                lead le = new lead();
                le.Account__c=con.AccountId;
                ldList.add(le);
            }
        } 
        update ldList;
    }
    /*}catch(exception e){
        system.debug('exception--->'+e);
    }*/
}