public class fakeAccountsListController {
    public String sortColumn;
    public String orderBy;
    public List<Account> results;
    public List<Account> getAccountList() {   
        results = Database.query(
            'SELECT Id, Name, Phone, NumberOfEmployees, Associated_Contacts__c, Owner.Email ' +
            'FROM Account ' + 'ORDER BY' + sortColumn + '' + orderBy);
        
        return results;
    }
    
    public fakeAccountsListController(ApexPages.StandardSetController stdCon){
        results = (List<Account>)stdCon.getRecords();
        sortColumn = ' Phone';
        orderBy = ' DESC';
    } 
    
    // THESE METHODS ARE FOR ALTERNATING SORT ON CLICK OF FACET. WHEN USING ONLY CUSTOM CONTROLLER WITH VF PAGE
    // THEY WORK. WHEN USING STANDARD CONTROLLER WITH CONTROLLER EXTENSION FUNCTIONALITY IS BROKEN.
    public void sortByName() {
        this.sortColumn = ' Name';
        if(orderBy == ' ASC'){
            orderBy = ' DESC';
        }
        else{
            orderBy = ' ASC';   
        }
    }
    
    public void sortByPhone() {
        if(orderBy == ' ASC'){
            this.sortColumn = 'Phone';
            orderBy = ' DESC';
        }
        else{
            this.sortColumn = 'Phone';
            orderBy = ' ASC';   }
    }
    
    public void sortByNumEmpl() {
        this.sortColumn = 'NumberOfEmployees';
        if(orderBy == ' ASC'){
            orderBy = ' DESC';
        }
        else{
            orderBy = ' ASC';}
    }
    
    public void sortByAssCons() {
        this.sortColumn = 'Associated_Contacts__c';
        if(orderBy == ' ASC'){
            orderBy = ' DESC';
        }
        else{
            orderBy = ' ASC';   }
    }
    
    public void sortByOwnerEmail() {
        this.sortColumn = 'Owner.Email';
        if(orderBy == ' ASC'){
            orderBy = ' DESC';
        }
        else{
            orderBy = ' ASC';   
        }
    }   
}