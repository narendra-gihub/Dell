public with sharing class N_CreateAccount {
    @AuraEnabled
    public static void createRecord (Account acc){ 
        try{
            System.debug('CreateAccountRecord===>'+acc);
            if(acc != null){
                insert acc;
            }   
        } catch (Exception ex){   
        }
    }    
}