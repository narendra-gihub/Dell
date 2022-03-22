/*
Description:
Create: Narendra 21-12-19
Modification: Narendra  
*/

trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    /****************** Before Insert *******************/    
    if(trigger.isBefore && trigger.isInsert){    
        
        /****************** Prevent creating duplicates ******************/
        for(account acc:trigger.new){
            List<Account> accList=[Select id from Account where Name=:acc.Name];  
            if(accList.size()>0)
            {
                acc.Name.addError('You Cannot Create the Duplicate Account');
            }
        }
        
        
        
        /********* Create contacts based on account field (i.e No.of contacts) *********/
        list<contact> listContact = new list<contact>();
        map<id,decimal> mapAcc=new map<id,decimal>();
        for(Account acc:trigger.new){
            mapAcc.put(acc.id,acc.No_Of_Contacts__c);
        }
        system.debug('mapAcc--->'+mapAcc);
        
        if(mapAcc.size()>0 && mapAcc!=null){
            for(Id accId:mapAcc.keyset()){
                for(integer i=0;i<mapAcc.get(accId);i++){
                    contact newContact=new contact();
                    newContact.accountid=accId;
                    newContact.lastname='contact'+i;
                    listContact.add(newContact);
                }
            }
        }
        if(listContact.size()>0 && listContact!=null){
            insert listContact;
            system.debug('listContact--->'+listContact);
        }
        
        
        /********* Create contact when create Account *********/
        list<contact> contlist = new list<contact>();
        for(account acc:trigger.new){
            contact cont = new contact();
            cont.AccountId=acc.id;
            cont.LastName=acc.name;
            cont.Phone=acc.phone;
            contlist.add(cont);
        }
        insert contlist;
        
        
        
        
        
        
    }
    /****************** Before Update ******************/
    
    if(trigger.isBefore && trigger.isUpdate){  
        list<contact> conList=new list<contact>();
        list<opportunity> oppList =new list<opportunity>();
        for(account acc:trigger.new){
            list<contact> conList02=[select id,phone from contact where accountId =:acc.id];
            for(contact cont:conList02){
                cont.phone = acc.Phone;
                conList.add(cont);
            }
            list<opportunity> oppList02=[select id,name from opportunity where accountId =:acc.id];
            for(opportunity opprt:oppList02){
                opprt.name = acc.name;
                oppList.add(opprt);
            }
        }
        
    }
     
    /****************** Before Delete ******************/
    if(trigger.isBefore && trigger.isDelete){  
        for (Account a : [SELECT Id FROM Account WHERE Id IN (SELECT AccountId FROM Opportunity) AND Id IN :Trigger.old]) {
            Trigger.oldMap.get(a.Id).addError('Cannot delete account with related opportunities.');
        }
    } 
     
    /****************** Before Delete ******************/
    if(trigger.isAfter && trigger.isInsert){  
        //Integer recordCount = Trigger.New.size();
        //contact cnt = new contact();
    }
    
    /******************* Before Update ******************/
    if(trigger.isAfter && trigger.isUpdate){  
        
        /********* Add an opportunity for each account if it doesn't already have one *********/
        List<Opportunity> oppList = new List<Opportunity>();
        // Get the related opportunities for the accounts in this trigger
        Map<Id,Account> acctsWithOpps = new Map<Id,Account>([SELECT Id,(SELECT Id FROM Opportunities) FROM Account WHERE Id IN :Trigger.New]);
        // Add an opportunity for each account if it doesn't already have one.
        // Iterate through each account.
        for(Account a : Trigger.New) {
            System.debug('acctsWithOpps.get(a.Id).Opportunities.size()=' + acctsWithOpps.get(a.Id).Opportunities.size());
            // Check if the account already has a related opportunity.
            if (acctsWithOpps.get(a.Id).Opportunities.size() == 0) {
                // If it doesn't, add a default opportunity
                oppList.add(new Opportunity(Name=a.Name + ' Opportunity',
                                            StageName='Prospecting',
                                            CloseDate=System.today().addMonths(1),
                                            AccountId=a.Id));
            }           
        }
        if (oppList.size() > 0) {
            insert oppList;
        }
        
    }
    
    /****************** Before Delete ******************/
    if(trigger.isAfter && trigger.isDelete){  
        
        
    }
    
    
    
    
    
    /****************** Before Delete ******************/
    if(trigger.isAfter && trigger.isUndelete){  
        
        
    }    
    
}