public class ProductController {
    @auraEnabled
    public static list<OpportunityLineItem> PushOlIItems(id OLIId){
        return[SELECT Id, Name, Quantity, TotalPrice, OpportunityId FROM OpportunityLineItem where opportunityId=:OLIId];
    }
}