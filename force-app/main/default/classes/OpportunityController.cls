public class OpportunityController {
    @InvocableMethod 
    public static void createCase(){
        case c = new case();
        c.Status='New';
        c.AccountId='0016F00003mr8wO';
        c.Opportunity__c='0066F000019JYbG';
        c.Origin='Web';
        insert c;
    }
    @future
    public static void createCase2(string accName,boolean active){
        /*case c = new case();
        c.Status='New';
        c.AccountId='0016F00003mr8wO';
        c.Opportunity__c='0066F000019JYbG';
        c.Origin='Web';
        insert c;*/
        
    }
}