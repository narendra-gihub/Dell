({
	streamVideo : function(component, event, helper) {
        var resultEvt = $A.get("e.c:PlayVideoEvent");
        resultEvt.setParams({"playFile":"true"});
         resultEvt.setParams({"src":"https://www.youtube.com/watch?v=IDIYJPLzLcI"});
        resultEvt.fire();
	},
    streamVideo2 : function(component, event, helper) {
        var resultEvt = $A.get("e.c:PlayVideoEvent");
        resultEvt.setParams({"playFile":"true"});
        resultEvt.setParams({"src":"https://tv.hoopla.net/#/gUE7fKk"});
        resultEvt.fire();
	}
})