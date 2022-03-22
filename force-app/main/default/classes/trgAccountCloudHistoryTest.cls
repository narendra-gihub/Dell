@istest(SeeAllData=true)
public class trgAccountCloudHistoryTest{
Private Static testmethod void myTestmethod(){
List<Account> listRecords = new List<Account>([SELECT Id FROM Account LIMIT 1]);
if (listRecords != null && listRecords.size() > 0) {
update listRecords;
}
}
}