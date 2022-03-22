public class OppHelperController {
    public void createOrder(list<opportunity> newList){
        list<order> ordlist = new list<order>();
        for(opportunity opp:newList){
            if(opp.StageName=='CLosed Won'){
                order ord = new order();
                ord.AccountId=opp.accountid;
                ord.Opportunity__c = opp.id;
                ord.EffectiveDate=opp.closedate;
                //ord.ContractId=opp.ContractId;
                ord.Status='Draft';
                ordlist.add(ord);
            }
        }
        insert ordlist;
    }
    @AuraEnabled
    public static list<opportunity> getOpportunities(){
        return [SELECT Id, Name, Amount, StageName, CloseDate FROM Opportunity];
    }
}