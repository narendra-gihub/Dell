({
	GetAllOlIItems : function(component,Event) {
		var prdResults = component.get('c.PushOlIItems');
        console.log('prdResults--->'+prdResults);
        prdResults.setParams({
            OLIId:component.get('v.recordId')
        });
        prdResults.setCallback(this, function(response){
            var state = result.getState();
            if (component.isValid() && state === "SUCCESS"){
                component.set("v.productList", response.getReturnValue());
            }
        });
        $A.enqueueAction(prdResults);
	}
})