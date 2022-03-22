({
    fetchAcc : function(component, event, helper) {
        component.set('v.mycolumns', [
            {label: 'Account Name', fieldName: 'Name', type: 'text'},
            {label: 'Industry', fieldName: 'Industry', type: 'text'},
            {label: 'Phone', fieldName: 'Phone', type: 'Phone'},
            {label: 'Website', fieldName: 'Website', type: 'url '}
        ]);
        var action = component.get("c.fetchRecords");
        action.setCallback(this, function(response){
            var state = result.getState();
            if (component.isValid() && state === "SUCCESS"){
                component.set("v.acctList", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})