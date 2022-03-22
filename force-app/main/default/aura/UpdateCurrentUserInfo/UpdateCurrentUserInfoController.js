({
	doInit : function(component, event, helper) {
	var action = component.get("c.fetchUser");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
                component.set("v.userInfo", storeResponse);
            }
        });
        $A.enqueueAction(action);
    },
    updateUserInfo:function(component, event, helper) {
    	var action = component.get("c.UpdateCurrentUser");
        action.setParams({ firstName : component.find("fName").get("v.value"),
                           lastName : component.find("lName").get("v.value") });
        
        $A.enqueueAction(action);
    }
})