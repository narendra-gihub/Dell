public class CreateContact {
    public void prepareData(id accId){
        contact con = new contact();
        con.AccountId=accId; 
        con.firstName='Hemanth';
        con.LastName='Kumar';
        con.Phone='897987987';
        con.Amount__c=200;
        insert con;
    }
}