({
	hadlerAction : function(component, event, helper) {
		var evntReslt = event.getParam("aeMessage");
        component.set("v.ChildAttr",evntReslt);
	}
})