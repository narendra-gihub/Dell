public class recTrCls{
    public static boolean recvar=true;
    public static void recTrMthd(){
        if(recvar==true){
            recvar=false;
            account acct = new account();
            acct.name='Recursive Trigger';
            acct.type='Prospect';
            acct.phone='7987987989';
            Insert acct;
        }
    }
}