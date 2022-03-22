({
    setEventParam : function(component, event, helper) {
        var cData = component.get('v.data');
        var appEvent = $A.get("e.c:N_aeEvent"); 
        appEvent.setParams({
            "message" : cData
        }); 
        appEvent.fire(); 
    }
})