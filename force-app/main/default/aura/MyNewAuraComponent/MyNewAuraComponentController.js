({
/************************************************************** Basic Manipulation  Start **********************************************************************************/     
AddNumber : function(component, event, helper) {
        var getFirstNumber=component.get('v.NewAttr');
        
        var getSecondNumber=component.get('v.NewAttr2');
        
        var result=Number(getFirstNumber)+Number(getSecondNumber);
        
        component.set('v.isCalculated',true);
        component.set('v.result',result);
        
    },
/************************************************************** Basic Manipulation  End **********************************************************************************/     

  /************************************************************** System event to handle the process Start ***************************************************************/  
    doInit : function(component,event,helper){
        var action=component.get('c.getContact');                                                                   //Step 1- Get the Controller Method
        var accid=component.get('v.recordId');                                                                      //Step 2- Get The Record Id from the pages
        action.setParams({                                                                                          //Step 3- Set The Parameters which is being passed to the Controller Method
            'aid': accid
        });
        action.setCallback(this,function(response){                                                                 //Step 4- Callback function to get the state and response and set that responsevalue to the particualar list or array of object
            var state=response.getState();
            if(state=="SUCCESS")
            {
                var responseValue=response.getReturnValue();
                //console.log(JSON.stringify(responseValue));
                 component.set('v.Contactlist',responseValue);
            }
           // $A.get('e.force:refreshView').fire();                                                                   // Additional Refresh the component without page refresh
        });
        
        $A.enqueueAction(action,false);                                                                             //Step 5- Enque the Action for processing
        //$A.get('e.force:refreshView').fire();                                                                       
    },
  /************************************************************** System event to handle the process End *********************************************************************/  


    /************************************************************** Navigation TO Sobject On Button Click Start ***************************************************************/

    redirect: function(component,event,helper){
        var eventsource=event.getSource();                                                                          //Step  1- for getting event source and id
        var eventid=eventsource.get('v.name');
        //debugger;
        var navevent=$A.get("e.force:navigateToSObject");
        
        navevent.setParams({                                                                                        //Step  2- for navigation
            'recordId':eventid,
            'slideDevName':'detail'
        });
        navevent.fire();                                                                                            //Step  3- For Final output in navigation
    
    }

    /************************************************************** Navigation TO Sobject On Button Click End ***************************************************************/

})