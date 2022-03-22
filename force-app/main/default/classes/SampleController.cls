public with Sharing class SampleController
{   
    public List<Account> accList {get;set;}
    public List<Customers__c> custList {get;set;}   
      
    public SampleController()
    {
        accList = [SELECT Name, AccountNumber FROM Account limit 10];
        custList = [SELECT Name,states__c FROM Customers__c];
    }
}