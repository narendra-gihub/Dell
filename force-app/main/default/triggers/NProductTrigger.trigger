trigger NProductTrigger on NProduct__c (after insert,after update,after delete,after undelete) {
    //List of product record ids to update
    Set<ID> setID = new Set<ID>(); 
    
    // list for products
    List<NOrder__c> lstPro = new List<NOrder__c>();
    
    // For after insert operation
    if(trigger.isinsert){
        for(NProduct__c c : trigger.new){
            setID.add(c.NOrder__c);
        }
    }
    
    // For after undelete operation
    if(trigger.isundelete){
        for(NProduct__c c : trigger.new){
            setID.add(c.NOrder__c);
        }
    }
    
    // For after delete operation
    if(trigger.isDelete){
        system.debug('Insert Operation');
        for(NProduct__c c : trigger.old){
            setID.add(c.NOrder__c);
        }
    }
    
    // for after update operation 
    if(trigger.isUpdate){
        system.debug('Insert Operation');
        for(NProduct__c c : trigger.new){
            if(c.NOrder__c != null){
                if(trigger.oldmap.get(c.id).NOrder__c != c.NOrder__c){
                    setID.add(c.NOrder__c);     
                }
            } 
            setID.add(trigger.oldmap.get(c.id).NOrder__c);
        }
    }
    
    if(setid.size() > 0){
        lstPro = [Select id,Total_Amount__c,(Select id,amount__c from NProducts__r) from NOrder__c where id IN : setID];
    }
    
    // Looping list of products based on product set 
    for(NOrder__c acc : lstPro){
        decimal val = 0;
        for(NProduct__c con : acc.NProducts__r){
            if(con.amount__c==null){
                con.amount__c=0;
            }
            val += con.amount__c;
        }
        acc.Total_Amount__c = val;
    }
    update lstPro;
}