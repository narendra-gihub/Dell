({
    getContacts : function(component,event,helper) {
        
        var action = component.get("c.getContacts");
        action.setParams({
            accId : component.get("v.recordId")
        });
        action.setCallback(this, function(result){
            var state = result.getState();
            if (component.isValid() && state === "SUCCESS"){
                component.set("v.ContactsList",result.getReturnValue());   
            }
        });
        $A.enqueueAction(action);
    }
})