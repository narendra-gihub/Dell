({
	sendData : function(component, event, helper) {
        var RecEvnt = $A.get("e.c:aeEvent");
        var cmpreslt = component.get("v.ParentAttr");
        RecEvnt.setParams({"aeMessage":cmpreslt});
        RecEvnt.fire();    
	}
})