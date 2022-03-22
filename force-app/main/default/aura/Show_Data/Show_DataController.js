({
	textChange : function(component, event, helper) {
		alert('You are changing the message value from controller');
        component.set('v.message','Customer Registration Screen');
        helper.textChangeHelper();
	}
})