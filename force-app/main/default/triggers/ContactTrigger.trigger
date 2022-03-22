trigger ContactTrigger on Contact (before insert,before update,before delete,after insert,after update,after delete,after undelete) {
    
    
    if(trigger.isAfter && trigger.isInsert){
        /****************** Update account field from no of contacts are related ******************/
        if(trigger.isAfter && trigger.isInsert){
            set<id> accId = new set<id>();
            for(contact con:trigger.new){
                accId.add(con.AccountId);
            }
            list<account> acclist = [select id,No_Of_Contacts__c from account where id in:accId];
            list<contact> conlist = [select id,name from contact where accountId in : accId];
            for(account acc:acclist){
                acc.No_Of_Contacts__c=conlist.size();
            }
            update acclist;
        }
        
    }        
    
    /****************** Rollup summery b/w accounts and contacts ******************/
    if(trigger.isAfter && trigger.isInsert && trigger.isUpdate && trigger.isUndelete) {  
        Map<ID,Account> accountMap = new Map<ID,Account>(); 
        List<ID> accID = new List<ID>();
        //Check for type of DML Operation, For Insert, Update and Undelete we have Trigger.New
        if(Trigger.IsInsert || Trigger.IsUpdate || Trigger.IsUndelete){
            for(Contact C1: Trigger.new){
                //Add all new AccountID in the List 
                if(C1.AccountID != NULL)
                    accID.add(C1.AccountID);
            }
        }
        //Check for type of DML Operation, For Delete we have Trigger.Old
        if(Trigger.IsDelete){
            for(Contact C2: Trigger.old){
                if(C2.AccountID != NULL)
                    accID.add(C2.AccountID);
            }
        }
        //Check if List is not empty
        if(accID!=NULL && accID.size()>0){
            //Add all the accounts in the Map, to map ID with the Account Cost
            for(ID AccountID : accID){
                accountMap.put(AccountID, new Account(ID = AccountID, Total_Amount__c = 0));
            }
            //Calculate the Total Account Cost based on the Contact Cost
            for(Contact C : [SELECT ID, AccountID, Amount__c FROM Contact WHERE AccountID IN :accID]){
                accountMap.get(C.AccountID).Total_Amount__c += c.Amount__c;
            }
            //Commit to the Database
            Database.update(accountMap.values());       
        }    
    }    

}