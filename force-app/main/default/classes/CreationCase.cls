public class CreationCase {
@AuraEnabled
    public static case getCase(String status,string origin){
        System.debug('Case Obje :: '+status);
        System.debug('case '+origin);
        Case c = new case();
        c.Status=Status;
        c.Origin=Origin;
        insert c;
        return c;
    }
    
}