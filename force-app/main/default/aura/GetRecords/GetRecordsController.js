({
    GetCustomerRecords : function(component, event, helper) {
        var Custvalues = component.get('c.getcustomers'); 
        Custvalues.setParams({
        });
        Custvalues.setCallback(this,function(response){
            var state = response.getState();
            if(state==='SUCCESS'){
                component.set('v.Customers',response.getReturnValue());   
            }else{
                alert('Something went wrong');
            }
        }); 
        $A.enqueueAction(Custvalues);              
    }
})