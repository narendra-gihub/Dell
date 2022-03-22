({
	Pulldata : function(component, event, helper) {
		var msg2 = component.find('AMId');
        
        var amResult = msg2.AuraMtd();
        alert('msg2--->'+amResult);
        component.set('v.message2',amResult);
	}
})