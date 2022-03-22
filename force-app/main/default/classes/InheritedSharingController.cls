/*
Now you can specify the Inherited Sharing keyword on an Apex class, which allows the class to run your apex code
-with or without sharing settings, depending on the class that called it.An Apex class with Inherited Sharing 
-enables you to pass security review and ensure that your privileged Apex code is not used in unexpected or insecure ways.
An Apex class with Inherited Sharing runs as with sharing when used as a Visualforce page controller, Apex REST service, 
-or an entry point to an Apex transaction.An Apex class with Inherited Sharing is being called from some other class 
-which is having without sharing setting, then it will run in without sharing mode.Here is an example of an Apex class 
-with Inherited Sharing and a Visualforce invocation of that Apex class. Here the running user sharing access contacts 
-will be displayed. If the declaration Inherited Sharing will be omitted, even contacts that the user has no rights to 
-view will be displayed due to the insecure default behavior of omitting the declaration.
*/
public inherited sharing class InheritedSharingController{
    public List<Contact> getAllContacts(){
        return [SELECT Name FROM Contact];
    }
}