({
	GetReslt : function(component, event, helper) {
		var cmpReslt = component.find("AMCmp");
        var amResults = cmpReslt.AMName();
        alert('amResults>>>'+amResults);
		component.set("v.attrTest",amResults); 
	}
})