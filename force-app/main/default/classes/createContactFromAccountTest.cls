@isTest
public class createContactFromAccountTest {
    @isTest
    public static void  createContMethod(){
        account acc = new account();
        acc.name='testAccount';
        acc.Industry='Agriculture'; 
        acc.Phone='899879878';
        insert acc;
        CreateContact cont = new CreateContact();
        cont.prepareData(acc.Id);
    }
}