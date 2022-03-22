public class DellModelTriggerHandler {
    public static void CaseOnDellModel(list<DellModels__c> dmlist){
        list<case> caselist = new list<case>();
        for(DellModels__c dm:dmlist){
            if(dm.IsExpired__c==true){
                case cs = new case();
                cs.Status='New';
                cs.Origin='Web';
                cs.Priority='High';
                cs.Description='You are inserting the model which is expired. Please verity and make it change';
                caselist.add(cs); 
            }
        }insert caselist;    
    }
}