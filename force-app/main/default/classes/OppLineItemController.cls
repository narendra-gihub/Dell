public class OppLineItemController {
    
    @AuraEnabled
    public static List <OpportunityLineItem> fetchOppLineItems(id oppID) {
        system.debug('oppID-->'+oppID);
        List<OpportunityLineItem> oppLinesList = new list<OpportunityLineItem>();
        oppLinesList = [SELECT Id, OpportunityId, Name, Quantity, UnitPrice, ListPrice FROM OpportunityLineItem where opportunityId=:oppID];
        return oppLinesList;
    }
}