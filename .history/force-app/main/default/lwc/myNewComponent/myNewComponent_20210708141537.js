import { LightningElement,track } from 'lwc';

export default class MyNewComponent extends LightningElement {

    @track firstName = 'World';
    count='0';
    size;
    changeHandler(event)
    {
        debugger;
        this.size = event.target.value;
        if (this.size.length > 1) {
            
            this.firstName = this.size.length;
        }
        else {
            this.firstName = this.count - 1;
        }
                


    }
}