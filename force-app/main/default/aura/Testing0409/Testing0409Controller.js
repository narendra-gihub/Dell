({
	changetxt : function(component, event, helper) {
		alert('Welcome to controller js');
        //var result = component.get("v.Message");
        component.set("v.Message",'Hi Narendra');
        helper.helperMethod();
	},
    showdiv : function(component, event, helper) {
        component.set("v.cndtn",'True');
	}
})