/*
To improve the performance of the lightning component cache Salesforce introduced storable (cacheable) 
-in Winter’19 release. In API version 44.0 and later, you can mark an Apex method as storable (cacheable) 
-instead of using setStorable() on every JavaScript action that calls the Apex method to centralize your 
-caching notation for a method in the Apex class.Here is an example to cache data returned from an Apex method
-for lightning component, annotate the Apex method with @AuraEnabled(cacheable=true).
 */     

public class cacheableController {
     
    @AuraEnabled(cacheable = true)
    public static List<Account> getDirectCustomerAccount() {
        List<Account> accList = new List<Account>();
        accList = [SELECT Id, Name, Type, Industry, Phone
                   FROM Account WHERE Type = 'Customer - Direct'];
        return accList;
    }
}