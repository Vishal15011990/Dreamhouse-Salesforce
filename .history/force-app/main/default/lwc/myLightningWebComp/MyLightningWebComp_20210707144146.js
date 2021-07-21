import { LightningElement } from 'lwc';

export default class MyLightningWebComp extends LightningElement {

    dynamicgreeting = 'Hello';
    greetingHandler(event) {
        this.dynamicgreeting = event.target.value;
    }
}