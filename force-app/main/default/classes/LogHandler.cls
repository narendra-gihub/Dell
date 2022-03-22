public class LogHandler
{
    //Save information log
    public static void logInformation(String className, String methodName, String description){
        Log__c log = new Log__c();
        log.Class__c = className;
        log.Method__c = methodName;
        log.Description__c = description;
        log.Type__c = 'Information';
        Insert log;
    }
     
    //Save success log
    public static void logSuccessData(String className, String methodName, String description){
        Log__c log = new Log__c();
        log.Class__c = className;
        log.Method__c = methodName;
        log.Description__c = description;
        log.Type__c = 'Success';
        Insert log;
    }
     
    //Save exception log
    public static void logException(String className, String methodName, String description, Integer lineNumber){
        Log__c log = new Log__c();
        log.Class__c = className;
        log.Method__c = methodName;
        log.Description__c = description;
        log.Type__c = 'Error';
        log.Line_Number__c = lineNumber;
        Insert log;
    }
     
    //Save HTTP response log
    public static void logHTTPResponse(String className, String methodName, String description, HttpResponse response){
        Log__c log = new Log__c();
        log.Class__c = className;
        log.Method__c = methodName;
        log.Description__c = description;
        log.Type__c = 'Information';
        if(response != null){
            log.HTTP_Response__c = response.getBody();
            log.HTTP_Status_code__c = response.getStatusCode();         
        }
        Insert log;
    }
     
    //Save result log
    public static void logSaveResult(String className, String methodName, List<Database.SaveResult> saveResultList){
        List<Log__c> logList = new List<Log__c>();
        for (Database.SaveResult sr: saveResultList) {        
            if (sr.isSuccess()) {                    
                Log__c log = new Log__c();
                log.Class__c = className;
                log.Method__c = methodName;
                log.Type__c = 'Success';
                if(sr.getId() != null){
                    log.Object__c = sr.getId().getSObjectType().getDescribe().getName();
                    log.Record_Id__c = sr.getId();
                }
                logList.add(log);                    
            }else{
                Log__c log = new Log__c();
                log.Class__c = className;
                log.Method__c = methodName;
                log.Type__c = 'Error';
                log.Description__c = String.valueOf(sr.getErrors()[0].getMessage());
                logList.add(log);  
            }
        }
        if(!logList.isEmpty()){
            Insert logList;
        }   
    }
     
    //Upsert result log
    public static void logUpsertResult(String className, String methodName, List<Database.UpsertResult> upsertResultList){
        List<Log__c> logList = new List<Log__c>();
        for (Database.UpsertResult ur: upsertResultList) {        
            if (ur.isSuccess()) {                    
                Log__c log = new Log__c();
                log.Class__c = className;
                log.Method__c = methodName;
                log.Type__c = 'Success';
                if(ur.getId() != null){
                    log.Object__c = ur.getId().getSObjectType().getDescribe().getName();
                    log.Record_Id__c = ur.getId();
                }
                logList.add(log);                    
            }else{
                Log__c log = new Log__c();
                log.Class__c = className;
                log.Method__c = methodName;
                log.Type__c = 'Error';
                log.Description__c = String.valueOf(ur.getErrors()[0].getMessage());
                if(ur.getId() != null){
                    log.Object__c = ur.getId().getSObjectType().getDescribe().getName();
                    log.Record_Id__c = ur.getId();
                }
                logList.add(log);  
            }
        }
        if(!logList.isEmpty()){
            Insert logList;
        }   
    }
}