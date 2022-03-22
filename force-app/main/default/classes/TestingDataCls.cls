public class TestingDataCls {
    public static void updatevals(list<account> acc){
        for(account accval:acc){
            accval.phone='8096143883';
        }
        system.debug('val');
    }
}