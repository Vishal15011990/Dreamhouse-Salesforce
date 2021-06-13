({
    trigger: function(cmp, event) {
        // Call an Apex controller that throws an error
        var action = cmp.get("c.myController");
        action.setCallback(cmp, function(response){
            cmp.set("v.response", response);
        });
        $A.enqueueAction(action);
    },
    showSystemError: function(cmp, event) {
        // Handle system error
        var a='Operation can not be performed ';
        $A.warning(a);
    }
})
