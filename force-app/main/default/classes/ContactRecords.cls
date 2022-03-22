public class ContactRecords
{
    public List<Contact> DisplayContacts {get;set;}
    
    public void GetContacts()
        {
            DisplayContacts = [SELECT firstname,lastname,Phone from contact];
        }
}