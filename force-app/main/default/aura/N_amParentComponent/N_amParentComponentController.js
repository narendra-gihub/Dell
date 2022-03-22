({
     callAuraMethod : function(component, event, helper) {
            var childCmp = component.find("childComponent");
            var retnMsg = childCmp.GetMessageFromChild();
            component.set("v.parentAttr", retnMsg);
     }
})