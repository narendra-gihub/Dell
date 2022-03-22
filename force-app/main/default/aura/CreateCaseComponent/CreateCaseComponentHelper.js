({
    
    createCase: function(component, Case) {
        
        console.log('inside helper');
        
        
        
        
        var action = component.get("c.saveCase");
        
        console.log('after method called ');
        
        action.setParams({
            
            "Case": Case
            
            
            
        });
        
        action.setCallback(this, function(response){
            
            var state = response.getState();
            
            if (component.isValid() && state === "SUCCESS") {
                
                var Case = component.get("v.Case");
                
                Case.push(response.getReturnValue());
                
                component.set("v.Case", Case);
                
            }
            
        });
        
        $A.enqueueAction(action);
        
    },
    
})