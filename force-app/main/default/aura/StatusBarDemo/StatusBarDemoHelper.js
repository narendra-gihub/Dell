({
    doInit : function(component, event, helper)  {
        helper.computeProgress(component, event, helper);      
    },
    GetPercent: function(component, event, helper) {
        var action = component.get('c.getCountofFilledFields');
        action.setParams({
            recId : component.get("v.recordId"),
            sObjectName : 'Account'
        }); 
        action.setCallback(this, function(a) {
            component.set("v.BarVal" , a.getReturnValue().percent);
            component.set("v.dataset" , a.getReturnValue().filledFields);
            component.set("v.fieldsList" , a.getReturnValue().filledFields.split(','));
            component.set("v.datafilledfileds" , a.getReturnValue().filledFieldsCount);
            component.set("v.totalfields" , a.getReturnValue().updatableFieldsCount);
            
        });
        $A.enqueueAction(action);
    }
})