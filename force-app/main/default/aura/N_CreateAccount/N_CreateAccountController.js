({
    createAccount : function(component, event, helper) {
        console.log('Create record');
        
        //getting the candidate information
        var accounts = component.get("v.account");
        
        //Validation
        if($A.util.isEmpty(accounts.name) || $A.util.isUndefined(accounts.name)){
            alert('First Name is Required');
            return;
        }            
        if($A.util.isEmpty(accounts.phone) || $A.util.isUndefined(accounts.phone)){
            alert('Phone is Rqquired');
            return;
        }
        if($A.util.isEmpty(accounts.email) || $A.util.isUndefined(accounts.email)){
            alert('Email is Required');  
            return;
        }
        
        //Calling the Apex Function
        var action = component.get("c.createRecord");
        
        //Setting the Apex Parameter
        action.setParams({
            acc : account
        });
        
        //Setting the Callback
        action.setCallback(this,function(a){
            //get the response state
            var state = a.getState();
            
            //check if result is successfull
            if(state == "SUCCESS"){
                //Reset Form
                var newAccount = {'sobjectType': 'Account',
                                  'name': '',
                                  'phone': '',
                                  'email': ''
                                 };
                //resetting the Values in the form
                component.set("v.account",newAccount);
                alert('Record is Created Successfully');
            } else if(state == "ERROR"){
                alert('Error in calling server side action');
            }
        });
        //adds the server-side action to the queue        
        $A.enqueueAction(action);
    }
})