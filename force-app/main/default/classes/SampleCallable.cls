/* In Winter’19 release Salesforce introduced Callable interface in apex. 
   The interface enables developers to use a common interface to build loosely coupled integrations between Apex classes or triggers, 
   even for code in separate packages.
   This interface has one method call(String action, Map args). 
   It helps developer to call a method dynamically with the help of “Type” class.   
 */
public class SampleCallable implements Callable {
    //Method 1
    public String method1(String stringValue) {
        return 'Welcome ' + stringValue;
    }
     
    //Method 2
    public Decimal method2(Integer integerValue) {
        return integerValue + 100;
    }
     
    //Callable interface method
    public Object call(String action, Map<String, Object> args) {
        switch on action {
            when 'method1' {
                return this.method1((String)args.get('stringValue'));
            }
            when 'method2' {
                return this.method2((Integer)args.get('integerValue'));
            }
            when else {
                return null;
            }
        }
    }
}

/*
Execute:==>
Callable c = (Callable)Type.forName('SampleCallable').newInstance();
system.debug(c.call('method1', new map<String,Object>{'stringValue' => 'Biswajeet'}));
system.debug(c.call('method2', new map<String,Object>{'integerValue' => 5}));
*/