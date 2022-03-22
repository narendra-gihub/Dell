import { LightningElement,track,api } from 'lwc';

export default class QuerySelectorChild extends LightningElement {
    @track message='Click on button to receive parent text'; 
    @api
    getMessage(strString) {
        alert('strString>>>'+strString);
        this.message = strString; 
    }
}