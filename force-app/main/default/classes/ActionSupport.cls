public class ActionSupport
{
    
    public integer value1{get;set;}
    public integer value2{get;set;}
    public integer outvalue{get;set;}
    
    public String selectedvalue1{get;set;}
    
    public void callMethodinController()
    {
        if(selectedvalue1 == 'add')
        {
            outvalue = value1+value2;
        }else
        if(selectedvalue1 == 'mul')
        {
            outvalue = value1*value2;
        }else
        if(selectedvalue1 == 'div')
        {
            outvalue = value1/value2;
        }else
        if(selectedvalue1 == 'sub')
        {
            outvalue = value1-value2;
        }
        
    }
    public List<SelectOption> getAllvalues() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('--','--'));
        options.add(new SelectOption('add','ADD'));
        options.add(new SelectOption('mul','MUL'));
        options.add(new SelectOption('div','DIV'));
        options.add(new SelectOption('sub','SUB'));
        return options;
    }
}