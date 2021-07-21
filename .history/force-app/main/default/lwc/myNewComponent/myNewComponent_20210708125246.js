import { LightningElement,track } from 'lwc';

export default class MyNewComponent extends LightningElement {

    @track firstName = 'World';
    count = '';

    changeHandler(event)
    {
        
        this.firstName = event.target.value;
        this.count = this.count + 1;
    }
}