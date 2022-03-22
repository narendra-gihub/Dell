public class getDataController {
	@AuraEnabled
    public static list<account> getData(){
        return [select id,name from account];
    }
}