import { LightningElement,track } from 'lwc';

export default class CustomEventParent extends LightningElement {
    @track message='Loading...';
    handleCustomEvent(event) {
        this.message = event.detail; 
    } 
}