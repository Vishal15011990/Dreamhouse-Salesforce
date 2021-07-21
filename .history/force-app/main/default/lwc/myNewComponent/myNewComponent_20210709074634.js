import { LightningElement,track } from 'lwc';

export default class MyNewComponent extends LightningElement {

    @track firstName = '0';

    size;
    changeHandler(event)
    {
        debugger;
        this.size = event.target.value;
        if (this.size.length > 0) {
            
            this.firstName = this.size.length;
        }
        else {
            // @ts-ignore
            this.firstName = this.size.length - 1;
        }
                


    }
}