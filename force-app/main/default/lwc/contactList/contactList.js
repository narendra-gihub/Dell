import { LightningElement ,api, wire, track} from 'lwc';
import getContactsList from '@salesforce/apex/AccountDetailsController.getContactsList'; 
export default class LightningDatatableLWCExample extends LightningElement {
    @track Columns = [{
            label: 'Name',
            fieldName: 'Name',
            type: 'text',
            sortable: true
        }, 
        {
            label: 'Phone',
            fieldName: 'Phone',
            type: 'phone',
            sortable: true
        },
        {
            label: 'Email',
            fieldName: 'Email',
            type: 'Email',
            sortable: true
        }
    ];
 
    @track error;
    @track conList ;
    @api recordId;
    @api recId;
    
    @wire(getContactsList,{recordId:'$recordId'})
    wiredAccounts({
        error,
        data
    }) {
        if (data) {
            this.conList = data;
        } else if (error) {
            this.error = error; 
        }
    }
}