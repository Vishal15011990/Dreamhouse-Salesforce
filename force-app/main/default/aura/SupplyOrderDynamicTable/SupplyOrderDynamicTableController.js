({
    jsAction: function(component, event, helper){

        var showdatatable=component.find("showdata");
        $A.util.addClass(showdatatable, "show");

        var hidebutton=component.find("hidebutton");
        $A.util.addClass(hidebutton, "show");
            
            
    },
    dateController : function(component, event, helper){

        var today = $A.localizationService.formatDate(new Date(), "YYYY-MM-DD");
        var dateValue = component.get("v.todaysDate");
        
        if(dateValue!="")
        {
            if(new Date(dateValue) >= new Date(today)){
                
                component.set("v.todaysDate", dateValue);
                component.set("v.setvalue",false);
            }
            else{
                dateValue = null;
                component.set("v.setvalue",true);
            }
         }
    },

    keyCheck:function(component,event,helper){

        //debugger;
        var keyCode = (event.which) ? event.which : event.keyCode;
        if((keyCode < 65 || keyCode > 90) && (keyCode < 97 || keyCode > 123) && keyCode != 32 && (charCode < 48 || charCode > 57) ) {
            if (event.preventDefault) {
                event.preventDefault();
            } else {
                event.returnValue = false;
            } 
        } 


       var value = event.target.value;

       if(!$A.util.isEmpty(value))
       {
            console.log("Value entered " + value);
            if(value.length>=3)
            {
                var action=component.get('c.getaccountdata');

                action.setParams({
                    'keyword':value
                });


                action.setCallback(this,function(response){
                    var stat=response.getState();

                    debugger;
                    var responseResult=response.getReturnValue();
                    
                    component.set('v.Accountlist' , responseResult);
                    
                    var showdlist=component.find("showlist");
                    $A.util.removeClass(showdlist, "cust_style_accselect");

                    document.getElementById("dealerId").value="";
                });
                $A.enqueueAction(action,false);  
            }

        }
    },

    optionClickHandler: function (component, event, helper) {
        
        const selectedId = event.target.closest('li').dataset.id;
        const selectedValue = event.target.closest('li').dataset.value;

        component.set("v.AccountName", selectedValue);
        component.set("v.dealerId", selectedId);

        var hidelist=component.find("showlist");
        $A.util.addClass(hidelist, "cust_style_accselect");

        var action=component.get('c.getdealerproduct');
        
        action.setParams({
            'prodId':selectedId
        });

        action.setCallback(this,function(response){
            var stat=response.getState();
            
            var responseResult=response.getReturnValue();
            
            component.set('v.DealerList' , responseResult);

        });
        $A.enqueueAction(action,false);
    },

    fetchitem: function(component,event,helper){

        helper.fetchdataitem(component,event,helper);
        
    },
    saveInline :function(component,event){
     
        var total=0;
        var updatedRecords = component.find("datarecord").get( "v.draftValues" );
          
        var recordsitem=updatedRecords.length;
          
        var dealerlineolddata=component.get('v.DealerProductlist');
        var prodlen=dealerlineolddata.length;

        for(var i=0;i<recordsitem;i++)
        {
         for(var t=0;t<prodlen;t++)
         {
           if(updatedRecords[i].Id==dealerlineolddata[t].Id)
           {
             dealerlineolddata[t].Quantity=Number(updatedRecords[i].Quantity);
             dealerlineolddata[t].Price=Number(updatedRecords[i].Quantity)*dealerlineolddata[t].PerItemCost;
            
           }
          }
        }
        for(var z=0;z<prodlen;z++){
            total+=dealerlineolddata[z].Price;
        }
        component.set('v.DealerProductlist',dealerlineolddata);
        component.set('v.GrandTotal',total);
        component.find("datarecord").set("v.draftValues",null);
        
    }
    // createcontract: function(component,event,helper){
       

    //     var getSupplyorderdetail=component.get('v.DealerProductlist');

    //     var actionContract=component.get('c.createnewContract');
      
    //     actionContract.setParams({
           
    //     });
    //     actionContract.setCallback(this,function(response){
    //         var stat=response.getState();
           
    //         var contra=component.get('v.ContractList');
    //         var responseResult=response.getReturnValue();
    //         var nwlst=[];
    //         for(var i=0;i<responseResult.length;i++)
    //         {
               
    //           var space = responseResult[i].Name;

    //           nwlst.push(space);

    //         }
    //         console.log(JSON.stringify(nwlst));
    //         component.set('v.ContraBool', true);
    //         console.log(component.get('v.ContraBool'));
    //         component.set('v.ContractList', nwlst);
    //         //$A.get('e.force:refreshView').fire();
    //     });
    //     alert("Data Inserted");
    //     $A.enqueueAction(actionContract,false);
    // },

    
})