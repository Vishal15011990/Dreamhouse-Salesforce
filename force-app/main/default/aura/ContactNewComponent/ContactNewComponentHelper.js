({
    Savecontact : function(component, event, helper) {
       
        var action=component.get('c.insertContact');
       
        var accid=component.get('v.accid');
        
        action.setParams({
            'con':component.get('v.insertcontact'),
            'accid':accid
        });

        action.setCallback(this,function(response){
            var state=response.getState();
            var resultValue=response.getReturnValue();
            
        });

        $A.enqueueAction(action);
        $A.get("e.force:closeQuickAction").fire();
    }
})