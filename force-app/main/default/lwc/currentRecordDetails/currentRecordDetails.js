import { LightningElement, track, wire, api } from 'lwc';

export default class CurrentRecord extends LightningElement {
    @api recordId; 
}