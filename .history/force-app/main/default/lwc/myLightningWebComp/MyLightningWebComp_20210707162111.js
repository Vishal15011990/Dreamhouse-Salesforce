import { LightningElement , track} from 'lwc';

export default class MyLightningWebComp extends LightningElement {

    @track dynamicgreeting = 'Hello';
    greetingHandler(event) {
        this.dynamicgreeting = event.target.value;
    }
}