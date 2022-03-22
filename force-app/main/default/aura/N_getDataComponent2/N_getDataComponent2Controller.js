({
    getRecords : function(component, event, helper) {
        var action = component.get("c.fetchRecords");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.accounts", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})