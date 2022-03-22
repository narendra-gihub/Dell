({
	CallController : function(component, event, helper) {
		alert('Calling controller from component');
        component.set('v.message','Hi Divya, How are you doing');
	}
    
})