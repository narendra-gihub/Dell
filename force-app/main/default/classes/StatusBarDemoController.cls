public class StatusBarDemoController {    
    @AuraEnabled
    public static DataWRP getCountofFilledFields(String recId,String sObjectName){
        //public double totalfields{get;set;}    
        String query='select ';   
        double totalfields=0;
        double datafields=0;
        double updateablefields=0;
        String datafilledfileds='';
        
        Map<String,String> HCHBfiledsMap=new Map<String,String>();
        list<HCHB_Data__c> CSList = [SELECT Name FROM HCHB_Data__c where type__c='Account']; 
        for(HCHB_Data__c hchbObj:CSList){
            HCHBfiledsMap.put(hchbObj.Name,hchbObj.Name);
        }
        Map<String, Schema.SObjectField> fieldsMap = Schema.getGlobalDescribe().get(sobjectName).getDescribe().fields.getMap();
        for(String fieldName:fieldsMap.keyset()){
            System.debug('totalfields'+fieldName);
            if(fieldsMap.get(fieldName).getDescribe().isUpdateable() && HCHBfiledsMap.containskey(fieldsMap.get(fieldName).getDescribe().getName())){
                updateablefields+=1;
                query += fieldName+',';
            }
            //totalfields+=totalfields;
        }
        
        query = query.substring(0, query.length() - 1);
        query +=' from '+sobjectName+' where id=:recId';
        List<sObject> sObjectdata=Database.query(query);
        for(sObject obj:sObjectdata){
            for(String fieldName:fieldsMap.keyset()){
                if(fieldsMap.get(fieldName).getDescribe().isUpdateable() && HCHBfiledsMap.containskey(fieldsMap.get(fieldName).getDescribe().getName())&& obj.get(fieldName)!=''&&obj.get(fieldName)!=null  ){
                    datafields+=1;  
                    datafilledfileds+=fieldsMap.get(fieldName).getDescribe().getName()+',';
                }
            }
        }
        //totalfields=fieldsMap.keyset().size();
        totalfields=HCHBfiledsMap.keyset().size();
        System.debug('datafields'+datafields);
        double percentvalue = (updateablefields/totalfields) * 100;
        percentvalue = (datafields/updateablefields) * 100;
        System.debug(percentvalue+'percentvalue');
        DataWRP datawrpObj=new DataWRP();
        datawrpObj.percent=percentvalue;
        datawrpObj.filledFields=datafilledfileds;
        datawrpObj.filledFieldsCount=datafields.intvalue()+'';
        datawrpObj.updatableFieldsCount = updateablefields.intvalue()+'';  
        return datawrpObj;
        // return null;
        
    }
    class DataWRP{
        @AuraEnabled
        public Double percent;
        @AuraEnabled
        public String filledFields;
        @AuraEnabled
        public String filledFieldsCount;
        @AuraEnabled
        public String updatableFieldsCount;
    }    
}