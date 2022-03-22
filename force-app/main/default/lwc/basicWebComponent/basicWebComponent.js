import { LightningElement, track, api } from 'lwc';
export default class BasictWebComponent extends LightningElement {
    @track message = 'Type something';

    changeMessage(event) {
        this.message = event.target.value; 
    }
}