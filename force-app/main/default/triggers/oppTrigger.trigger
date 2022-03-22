trigger oppTrigger on Opportunity (before insert,before update,before delete,after insert,after update,after delete,after undelete) {
    
    if(trigger.isAfter && (trigger.isInsert || trigger.isUpdate)){
        OppHelperController oppHelper = new OppHelperController();
        oppHelper.createOrder(trigger.new);
    }
    
}