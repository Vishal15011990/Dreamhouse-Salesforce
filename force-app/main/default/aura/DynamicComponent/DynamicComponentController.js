({
    addMe : function(component, event, helper) {
        $A.createComponents(                                                                                    //Step 1-Syntax to create component
            
            [                
                ["ui:inputText",                                                                                // Step 2- Create the element which you want
                    {
                    "label":"Please Enter The First Name ",                                                     // Step 3- Create the Attribute 
                    "labelClass":"slds-form-element_label",
                    "aura:id":"intextId1",
                    "class":"slds-input"
                   }
                ],
                ["ui:inputText",
                    {
                    "label":"Please Enter The Last Name",
                    "labelClass":"slds-form-element_label",
                    "aura:id":"intextId2",
                    "class":"slds-input"
                    }
                ],
                ["ui:inputText",
                    {
                    "label":"Please Enter The Email Id",
                    "labelClass":"slds-form-element_label",
                    "aura:id":"intextId3",
                    "class":"slds-input"
                    }
                ],
                ["lightning:button",
                    {
                    "label":"Destroy All",
                    "aura:id":"destroyId",
                    "onclick":component.getReference("c.DestroyAll")
                    }
                ]
            ],
            function(newintexts,status,errorMessage){                                                                    // Step 4- Create a Callback function assigning
                if(status=="SUCCESS"){                                                                                   // parameters function(comp,stat,errormsg)
                    var body=component.get("v.body");
                    newintexts.forEach(function(item){
                        body.push(item);
                    });
                    component.set("v.body",body);
                }
            }
        );
    },
    DestroyAll : function(component){
        var comp=component.find("destroyId");
        comp.destroy();
        debugger;
        var cmp=component.find({instancesOf : "ui:inputText"});
        cmp.forEach(function(item){
            item.destroy();
        });
    }
})