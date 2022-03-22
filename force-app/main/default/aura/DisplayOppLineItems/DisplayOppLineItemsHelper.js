({
    fetchOppLInesHelper : function(component, event, helper) {
        alert('helper');
        component.set('v.mycolumns', [
            {label: 'Name', fieldName: 'Name', type: 'text'},
                {label: 'Quantity', fieldName: 'Quantity', type: 'number'},
                {label: 'UnitPrice', fieldName: 'UnitPrice', type: 'currency'},
                {label: 'ListPrice', fieldName: 'ListPrice', type: 'currency '}
            ]);
        var action = component.get("c.fetchOppLineItems");
        action.setParams({oppID:'v.recordId'});
        action.setCallback(this, function(response){
            var state = response.getState();
            alert('state-->'+state);
            if (state === "SUCCESS") {
                alert('values--->'+response.getReturnValue());
                component.set("v.OLIList", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})