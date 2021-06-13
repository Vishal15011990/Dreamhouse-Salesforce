({
    jsAction : function(component, event, helper) {
        var childcomp=component.find("childauramethodid");
        var msg=childcomp.childauramethod('its input from method call');
        component.set("v.parentattr", msg);
    }
})