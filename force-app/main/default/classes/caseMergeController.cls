public class caseMergeController {
    public static void mergeCases(list<string> caseIds){
        list<case> newCase =[select id,description from case where id=:caseIds[0] limit 1];
        list<case> extCase =[select id,description from case where id=:caseIds[1] limit 1]; 
        try {
            //merge newCase extCase;  
        }catch (DmlException e) {
            // Process exception
            System.debug('An unexpected error has occurred: ' + e.getMessage()); 
        }   
    }   
}