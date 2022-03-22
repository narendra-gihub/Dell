public class NProductHelper {
    //List of product record ids to update
    public static Set<ID> setID = new Set<ID>(); 
    
    // list for products
    public static List<NOrder__c> lstPro = new List<NOrder__c>();
    
    public static void insertProduct(list<Nproduct__c> NproList){
        for(NProduct__c c : NproList){
            setID.add(c.NOrder__c);
        }
        updateOders();
    }
    
    public static void undelProduct(list<Nproduct__c> NproList){
        for(NProduct__c c : NproList){
            setID.add(c.NOrder__c);
        }
        updateOders();
    }
    
    public static void updateProduct(list<Nproduct__c> NproList, map<id,Nproduct__c> NproMap){
        for(NProduct__c c : NproList){
            if(c.NOrder__c != null){
                if(NproMap.get(c.id).NOrder__c != c.NOrder__c){
                    setID.add(c.NOrder__c);     
                }
            } 
            setID.add(NproMap.get(c.id).NOrder__c);
        }
        updateOders();
    }
    
    public static void DelProduct(list<Nproduct__c> NproList){
        for(NProduct__c c : NproList){
            setID.add(c.NOrder__c);
        }
        updateOders();
    }
    
    public static void updateOders(){
        
        if(setid.size() > 0){
            if (Schema.sObjectType.NOrder__c.fields.Total_Amount__c.isAccessible()) {
            	lstPro = [Select id,Total_Amount__c,(Select id,amount__c from NProducts__r) from NOrder__c where id IN : setID];
            }
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

}