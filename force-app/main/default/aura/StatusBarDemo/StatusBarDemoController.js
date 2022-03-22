({
	doInit : function(component, event, helper) {
		//helper.doInit(component, event, helper) ;
        helper.GetPercent(component, event, helper) ;     
	},
    showData : function(component, event, helper) {
        var cmpTarget = component.find('fData');
        $A.util.addClass(cmpTarget, 'slds-show');
        $A.util.removeClass(cmpTarget, 'slds-hide');
    },
    hideData : function(component, event, helper) {
        var cmpTarget = component.find('fData');
        $A.util.addClass(cmpTarget, 'slds-hide');
        $A.util.removeClass(cmpTarget, 'slds-show');
    },
    
    // Model Box Functionality Start here
    openModel: function(component, event, helper) {
      // Set isModalOpen attribute to true
      component.set("v.isModalOpen", true);
   },
   closeModel: function(component, event, helper) {
      // Set isModalOpen attribute to false  
      component.set("v.isModalOpen", false);
   },
  
   submitDetails: function(component, event, helper) {
      // Set isModalOpen attribute to false
      //Add your code to call apex method or do some processing
      component.set("v.isModalOpen", false);
   }
   
})