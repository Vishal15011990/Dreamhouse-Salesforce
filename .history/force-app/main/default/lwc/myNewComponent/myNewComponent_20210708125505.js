import { LightningElement,track } from 'lwc';

export default class MyNewComponent extends LightningElement {

    @track firstName = 'World';
    count = '';

    changeHandler(event)
    {
        debugger;
        if (event.target.value > 1) {
            this.count = this.count + 1;
            this.firstName = this.count;
        }
        else {
            this.firstName = this.count - 1;
        }

    }
}