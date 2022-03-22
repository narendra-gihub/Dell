import { LightningElement } from 'lwc';

export default class QuerySelectorParent extends LightningElement {
    moveText(event){
        alert('calling from parent');
        this.template.querySelector('c-query-Selector-Child').getMessage('Query Selector');
    }
}

