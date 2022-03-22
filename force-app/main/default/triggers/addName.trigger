trigger addName on Customer_Product__c (before delete) {
    for(Customer_Product__c custPro:trigger.old){
        if(custPro.name=='MadhavaRao Modela'){
            custPro.addError('We can not do this action');
        }
    }
}