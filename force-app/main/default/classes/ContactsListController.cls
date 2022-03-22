public class ContactsListController
{
    private String sortOrder = 'LastName';
    public String ascendingOrDescending = ' ASC ';
   
    public List<Contact> getContacts()
    {
        List<Contact> results = Database.query(
        'SELECT Id, FirstName, LastName, Title, Email ' +
        'FROM Contact ' +
        'ORDER BY ' + sortOrder + ascendingOrDescending +
        'LIMIT 900'
        );       
        return results;
    }
   
    public void sortByLastName()
    {
        this.sortOrder = 'LastName';
       
        if(ascendingOrDescending == ' ASC ')
        {
            ascendingOrDescending = ' DESC ';
        }
        else
        {
            ascendingOrDescending = ' ASC ';
        }   
    }
   
    public void sortByFirstName()
    {
        this.sortOrder = 'FirstName';
       
        if(ascendingOrDescending == ' ASC ')
        {
            ascendingOrDescending = ' DESC ';
        }
        else
        {
            ascendingOrDescending = ' ASC ';
        }       
    }
}