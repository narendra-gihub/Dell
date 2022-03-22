({
	changeText : function(component, event, helper) {
		alert('Calling the controller from component file');
        component.set('v.textVal','Salesforce Lightning Training Program');
        helper.changeTextHelper();
	}
})