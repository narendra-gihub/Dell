import { LightningElement } from 'lwc';

export default class CustomEventChild extends LightningElement {
    moveText(event) {
        event.preventDefault();
        const message = 'Custom Event';
        const selectEvent = new CustomEvent('mycustomevent', {
            detail: message
        });
       this.dispatchEvent(selectEvent);
    } 
}