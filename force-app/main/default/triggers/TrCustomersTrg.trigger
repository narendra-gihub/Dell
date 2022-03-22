trigger TrCustomersTrg on Tr_Customers__c (before insert,before update,before delete,after insert,after update,after delete,after undelete) {
    // Before triggers 
    if(trigger.isBefore){
        if(trigger.isInsert || trigger.isUpdate){
            for(Tr_Customers__c trcust:trigger.new){
                if(trcust.Income__c>=100000){
                    trcust.Tax_Rate__c='10%';
                }
            }
            system.debug('');
        }
        
        if(trigger.isDelete){
            for(Tr_Customers__c cust:trigger.old){
                if(cust.Country__c=='India'){
                    cust.addError('You can not delete this record');
                }
            }
        }
    }
    
    //After triggers 
    if(trigger.isAfter){
        if(trigger.isInsert){
            list<Tr_Orders__c> TrOrdList=new list<Tr_Orders__c>();
            for(Tr_Customers__c trcust:trigger.new){
                if(trcust.Country__c=='India'){
                    Tr_Orders__c trOrd = new Tr_Orders__c();
                    trOrd.Amount__c=1000;
                    trOrd.Tr_Customer__c=trcust.Id;
                    TrOrdList.add(trOrd);
                }
            }
            insert TrOrdList;
        }
        
        if(trigger.isUpdate){
            map<id,tr_customers__c> mapCust = new map<id,tr_customers__c>();
            list<Tr_Orders__c> ordList=new list<Tr_Orders__c>();
            for(Tr_Customers__c trcust:trigger.new){
                mapCust.put(trcust.Id, trcust);
                ordList = [select id from Tr_Orders__c where Tr_Customer__c IN:mapCust.keyset()];
                if(ordList.size()>0){
                    for(Tr_Orders__c tCon:ordList){
                        tCon.amount__c=10000;
                    }
                    update ordList; 
                }
            }            
        }
    }
}