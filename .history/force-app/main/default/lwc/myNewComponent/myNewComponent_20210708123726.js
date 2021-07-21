import { LightningElement,track } from 'lwc';

export default class MyNewComponent extends LightningElement {

    @track firstName = '';
    changeHandler(event)
    {
        this.firstName = event.targetarray.value;
    }
}