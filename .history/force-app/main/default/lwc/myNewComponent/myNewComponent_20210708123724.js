import { LightningElement,track } from 'lwc';

export default class MyNewComponent extends LightningElement {

    @trackfirstName = '';
    changeHandler(event)
    {
        this.firstName = event.targetarray.value;
    }
}