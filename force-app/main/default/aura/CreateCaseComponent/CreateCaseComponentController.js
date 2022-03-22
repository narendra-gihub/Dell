({
    createCase : function(component, event, helper) {
        
        var emailAddress = component.find("emailaddress");
        var Email =  emailAddress.get("v.value");
        
        var titleOfEvent = component.find("titleofevent");
        var TitleOfEvent =  titleOfEvent.get("v.value");
        
        var requesterLastName = component.find("requesterlastname");
        var LastName =  requesterLastName.get("v.value");
        
        var requesterFirstName = component.find("requesterfirstname");
        var FirstName =  requesterFirstName.get("v.value");
        
        var nameOfTheOrganization = component.find("nameoftheorganization");
        var NameOfTheOrganization =  nameOfTheOrganization.get("v.value");
        
        var isMissionelement = component.find("isUSAFAmissionelement");
        var IsMissionElement =  isMissionelement.get("v.value");
        
        var whichMissionElement   = component.find("whichmissionelement");
        var WhichMissionElement =  whichMissionElement.get("v.value"); 
  
        var newCase = component.get("v.newCaseObject");
        console.log("Create Case: " + JSON.stringify(newCase));

        helper.createCase(component, JSON.stringify(newCase));
   
    }
})