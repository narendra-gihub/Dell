({
	callJsController : function(component, event, helper) {
		alert('Hi Welcome to Js Controller');
	},
    CallJsHelper : function(component, event, helper) {
		helper.helperController();
	},
    ChangeValues : function(component, event, helper) {
		component.set("v.BooleanVal","false");
	},
    ChangeValues2 : function(component, event, helper) {
		component.set("v.BooleanVal2","false");
	}
})