({
	sendVal : function(component, event, helper) {
        var appEvtVal = $A.get("e.c:ApplicationEvent");
        var appEvtValReslt = appEvtVal.setParams("textmsg","v.cmp1text");
        alert("appEvtValReslt-->"+appEvtValReslt);
        appEvtVal.fire();
	}
})