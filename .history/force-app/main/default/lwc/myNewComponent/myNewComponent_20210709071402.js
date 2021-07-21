import { LightningElement } from 'lwc';

export default class MyNewComponent extends LightningElement {

    firstName = 'World';
    count='0';
    size;
    changeHandler(event)
    {
        debugger;
        this.size = event.target.value;
        if (this.size.length > 0) {
            
            this.firstName = this.size.length;
        }
        else {
            this.firstName = this.size.length - 1;
        }
                


    }
}