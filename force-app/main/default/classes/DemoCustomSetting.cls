public class DemoCustomSetting
{
    public List<CS_Customer__c> getData {get;set;}
       public DemoCustomSetting ()

    {
  Map<String,CS_Customer__c>alldata= CS_Customer__c.getAll();

       getData = alldata.values();

    }  

   }