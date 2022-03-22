public class OppsearchController {
 
    List<Opportunity> OppSearchResult;
    public String searchString { get; set; }
    
    public List<Opportunity> getOppSearchResult() {
        return OppSearchResult;
    }
 
    public PageReference oppResult() {
        OppSearchResult = (List<Opportunity>)[FIND :searchString RETURNING Opportunity(Name)][0];
        return null;
    }
}