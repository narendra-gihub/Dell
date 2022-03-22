({
    doInit: function (cmp, event, helper) {
        var fetchData = {
            opportunityName: "company.companyName",
            accountName : "name.findName",
            closeDate : "date.future",
            amount : "finance.amount",
            contact: "internet.email",
            phone : "phone.phoneNumber",
            website : "internet.url",
            status : {type : "helpers.randomize", values : [ 'Pending', 'Approved', 'Complete', 'Closed' ] },
            actionLabel : {type : "helpers.randomize", values : [ 'Approve', 'Complete', 'Close', 'Closed' ]},
            confidenceDeltaIcon : {type : "helpers.randomize", values : [ 'utility:up', 'utility:down' ]}
        };


        cmp.set('v.columns', [
            {label: 'Opportunity name', fieldName: 'opportunityName', type: 'text'},
            {label: 'Stage', fieldName: 'StageName', type: 'text'},
            {label: 'Close Data', fieldName: 'CloseDate', type: 'date'}
        ]);

        helper.fetchData(cmp, fetchData, 100);
    },

    updateSelectedText: function (cmp, event) {
        var selectedRows = event.getParam('selectedRows');
        cmp.set('v.selectedRowsCount', selectedRows.length);
    }
});