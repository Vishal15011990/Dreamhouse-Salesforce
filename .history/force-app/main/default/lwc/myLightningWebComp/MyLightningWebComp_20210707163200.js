import { LightningElement } from 'lwc';

export default class MyLightningWebComp extends LightningElement {

    dynamicgreeting ='';
    greetingChangeHandler(event) {
        this.dynamicgreeting = event.target.value;
    }
}