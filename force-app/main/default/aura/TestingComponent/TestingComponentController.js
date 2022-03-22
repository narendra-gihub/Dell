({
    doinit : function(component, event, helper) {
        var now = new Date();
        var date = now.getDate();
        var month = now.getMonth() + 1;
        var fullYear = now.getFullYear();
        var today = fullYear + '-' + month + '-' + date;
        alert('Today:--->',today);
    }
})