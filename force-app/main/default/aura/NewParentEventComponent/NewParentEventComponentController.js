({
    handleEvent : function(component, event, helper) {
        console.log('variable:');

        var newparams=event.getParam("message");
        var accountattr=component.get('v.GetAccountEvent');

        console.log(JSON.stringify(accountattr));
        
        accountattr.push(newparams);

        component.set('v.GetAccountEvent', accountattr);

        
    }

})