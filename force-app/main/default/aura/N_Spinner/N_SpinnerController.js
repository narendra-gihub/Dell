({
    getContactLst : function(component, event, helper) {
        //call apex class method
        var action = component.get('c.fetchContact');
        action.setCallback(this, function(response) {
            //store state of response
            var state = response.getState();
            if (state === "SUCCESS") {
                //set response value in ListOfContact attribute on component.
                component.set('v.ListOfContact', response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    
    // this function automatic call by aura:waiting event  
    showSpinner: function(component, event, helper) {
        // make Spinner attribute true for display loading spinner 
        component.set("v.Spinner", true); 
    },
    
    // this function automatic call by aura:doneWaiting event 
    hideSpinner : function(component,event,helper){
        // make Spinner attribute to false for hide loading spinner    
        component.set("v.Spinner", false);
    }
    
})