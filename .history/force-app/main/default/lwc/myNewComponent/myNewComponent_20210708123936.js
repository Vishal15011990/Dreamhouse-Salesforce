import { LightningElement,track } from 'lwc';

export default class MyNewComponent extends LightningElement {

    @track firstName = 'World';
    changeHandler(event)
    {
        this.firstName = event.targetarray.value;
    }
}