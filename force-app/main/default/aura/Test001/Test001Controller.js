({
    checkValidity : function(component, event, helper) {
        var currentval = component.find('postcode').get('v.value');
        //var pstCode ='0234678';
        var actualVal = currentval.charAt(0);
        if(actualVal==='0'|| 
           actualVal==='2'||
           actualVal==='3'||
           actualVal==='4'||
           actualVal==='6'||
           actualVal==='7'||actualVal==='8'){
            alert('success');
        }else{
            alert('Failed');
        }
    }
})