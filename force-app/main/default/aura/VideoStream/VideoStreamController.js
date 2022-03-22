({
	playVideo : function(component, event, helper) {
		var message = event.getParam("playFile");
        component.set("v.runVideo", message); 
        var srcfile = event.getParam("src");
        if(srcfile!=undefined){
            component.set("v.src",srcfile);}
	}
})