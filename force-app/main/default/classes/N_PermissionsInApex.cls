public class N_PermissionsInApex {
    public N_PermissionsInApex(){
        //Enforcing object-level permissions (CRUD) in Apex
        Schema.DescribeSObjectResult descSObj = Schema.sObjectType.Contact;
        if (descSObj.isDeletable()) {
            // Delete contact
        }
        //Enforcing field-level permissions (FLS) in Apex
        if (Schema.sObjectType.Contact.fields.Email.isAccessible()) {
            Contact c = [SELECT Email FROM Contact];
        }
        //Enforcing Sharing Rules (Record Level Access)
    }
}