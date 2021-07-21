import { LightningElement , api} from 'lwc';

export default class MyLightningWebComp extends LightningElement {

    @api dynamicgreeting = 'Hello';
    greetingChangeHandler(event) {
        this.dynamicgreeting = event.target.value;
    }
}