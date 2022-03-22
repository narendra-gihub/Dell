@isTest
public class CreateAccountTest {
    @isTest
    public static void testData(){
        account acc = new account();
        acc.name='Amazon Sales';
        acc.Phone='909809809';
        acc.Industry='Agrucultrure';
        insert acc;
    }
}