import { LightningElement,track } from 'lwc';

export default class MyNewComponent extends LightningElement {

    @track firstName = 'World';
    count;
    size;

    changeHandler(event)
    {
        debugger;
        this.size = event.target.value;
        if (this.size.length > 1) {
            this.count = this.count + 1;
            this.firstName = this.count;
        }
        else {
            this.firstName = this.count - 1;
        }

    }
}