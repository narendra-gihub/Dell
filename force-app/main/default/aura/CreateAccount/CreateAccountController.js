({
    doInit: function(component, event, helper) {
        // Prepare a new record from template
        component.find("accountRecordCreator").getNewRecord(
            "Account", // sObject type (entityAPIName)
            null,      // recordTypeId
            false,     // skip cache?
            $A.getCallback(function() {
                var rec = component.get("v.newAccount");
                var error = component.get("v.newAccountError");
                if(error || (rec === null)) {
                    console.log("Error initializing record template: " + error);
                }
                else {
                    console.log("Record template initialized: " + rec.sobjectType);
                }
            })
        );
    },
    handleSaveaccount: function(component, event, helper) {
        if(helper.validateAccountForm(component)) {
            //component.set("v.simpleNewAccount.Id", component.get("v.recordId"));
            component.find("accountRecordCreator").saveRecord(function(saveResult) {
                if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
                    // record is saved successfully
                    var evt = $A.get("e.c:Result"); 
                    var resultsToast = $A.get("e.force:showToast");
                    resultsToast.setParams({
                        "title": "Saved",
                        "message": "The record was saved."
                    });
                    resultsToast.fire();
                    //Calls to next page in wizard -- Case Creation --
                    var evt = $A.get("e.force:navigateToComponent");
                    evt.setParams({
                        componentDef : "c:NewCase",
                        "Pass_Result" : recordId,    
                        //                    componentAttributes: {
                        //                        acctId : component.get("v.recordId")
                        //                                }
                    });
                    evt.fire();
                    //End of Call to next page in wizard -- Case Creation --
                    
                } else if (saveResult.state === "INCOMPLETE") {
                    // handle the incomplete state
                    console.log("User is offline, device doesn't support drafts.");
                } else if (saveResult.state === "ERROR") {
                    // handle the error state
                    console.log('Problem saving contact, error: ' + 
                                JSON.stringify(saveResult.error));
                } else {
                    console.log('Unknown problem, state: ' + saveResult.state +
                                ', error: ' + JSON.stringify(saveResult.error));
                }
            });
        }
    }
})