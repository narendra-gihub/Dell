({
    checkData : function(component, event, helper) {
        var action = component.get('c.getData');
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state === 'SUCCESS') {
                var result = response.getReturnValue();
                console.log('result>>>'+result);
                component.set("v.data",result);
            }
            else{
                alert('Error in getting data');
            }
        });
        $A.enqueueAction(action);
    }
})