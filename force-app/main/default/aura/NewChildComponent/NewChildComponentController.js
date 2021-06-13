({
    firecomponentevent : function(component, event, helper) {

        var action=component.getEvent('NewEventComponent');
        
       // console.log(JSON.stringify(component.get('v.GetAccount')));
        
        action.setParams({
            "message":component.get('v.GetAccount')
        });

        action.fire();
    }
})