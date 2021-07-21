import { LightningElement } from 'lwc';

export default class MyNewComponent extends LightningElement {

    firstName = '';
    changeHandler(event)
    {
        this.firstName = event.targetarray.value;
    }
}