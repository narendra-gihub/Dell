public with sharing class currentUserInfoCtrl {
   @AuraEnabled 
    public static user fetchUser(){
     // query current user information  
      User oUser = [select id,Name,TimeZoneSidKey,Username,Alias,Country,Email,FirstName,LastName,IsActive,IsPortalEnabled 
                 FROM User Where id =: userInfo.getUserId()];
        return oUser;
    } 
    public static void UpdateCurrentUser(string firstName,string lastName){
        system.debug('values are >>>>>'+firstName+'&'+lastName);
    	user u = fetchUser();
        system.debug('userInfo'+u);
        u.FirstName=firstName;
        u.LastName=lastName;
        update u;
    }
    
}