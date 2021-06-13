({
    myAction : function(component, event, helper) {
        var action=event.getParam('arguments');
        if(action){
            var nameargs=action.Name;
            return "Hello "+ action + " its called from child argument";
        }
    }
})