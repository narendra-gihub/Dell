({
	ReceiveEnt : function(component, event, helper) {
		var getEvtVal = event.getParam("textmsg");
        alert("getEvtVal--->"+getEvtVal);
        component.set("v.cmp2text",getEvtVal);    
	}
})