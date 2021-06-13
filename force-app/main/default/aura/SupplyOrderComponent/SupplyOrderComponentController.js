({
    jsAction: function(component, event, helper){
            var hidedatatable=component.find("showdata");
            $A.util.addClass(hidedatatable, "show");

            var hidebutton=component.find("hidebutton");
            $A.util.addClass(hidebutton, "show");
            
            //  var hidegrand=component.find("hidegrand");
            //  $A.util.addClass(hidegrand, "show");
            
            // var showdata=component.find("showdata");
            // $A.util.addClass(showdata, "showdatatable");
            
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
                    
                    document.getElementById("cust_style_accselect").style.display="block";
                    document.getElementById("dealerId").value="";
                });
                $A.enqueueAction(action,false);  
            }

        }
    },
    hideselect:function(component){
        //document.getElementById("cust_style_accselect").style.display="none";
    },

    optionClickHandler: function (component, event, helper) {
        
        const selectedId = event.target.closest('li').dataset.id;
        const selectedValue = event.target.closest('li').dataset.value;

        component.set("v.AccountName", selectedValue);
        component.set("v.dealerId", selectedId);

        document.getElementById("cust_style_accselect").style.display="none";

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
        var total=0;
        var proditem=[];
        var responseResult;

        var action=component.get('c.getlineproductitem');

        var value=document.getElementById("prodselect").value;

        console.log(value);

        action.setParams({
            'dealerproductId':value
        });

        action.setCallback(this,function(response){
            var stat=response.getState();

            debugger;
            responseResult=response.getReturnValue();
          

            proditem=responseResult.lstDealerProduct[0].Dealer_Product_Line_Items__r;
            var length= proditem.length;
                        
            if(length>0){
                for(var i=0;i<length;i++ ){ 
                    total+=proditem[i].Price__c;
                }                
            }
            component.set('v.GrandTotal',total);
            component.set('v.DealerProductItem' , responseResult.lstDealerProduct[0].Dealer_Product_Line_Items__r);

            var showdatatable=component.find("showdata");
            $A.util.removeClass(showdatatable, "show");
            
            var showbutton= component.find("hidebutton");
            $A.util.removeClass(showbutton, "show");

        });
        $A.enqueueAction(action,false);
        
    },
    createcontract: function(component,event,helper){

        //var getdealerId=component.get('v.dealerId');

        var getproductId=document.getElementById("prodselect").value;

        var getorderdate=component.get("v.todaysDate");

        
        var actionContract=component.get('c.createnewContract');
        actionContract.setParams({
            'dealerproductId':getproductId,
            'orderdate':getorderdate
        });
        actionContract.setCallback(this,function(response){
            var stat=response.getState();
           
            var contra=component.get('v.ContractList');
            debugger;
            var responseResult=response.getReturnValue();
            var nwlst=[];
            for(var i=0;i<responseResult.length;i++)
            {
               
              var space = responseResult[i].Name;

              nwlst.push(space);

            }
            console.log(JSON.stringify(nwlst));
            component.set('v.ContraBool', true);
            console.log(component.get('v.ContraBool'));
            component.set('v.ContractList', nwlst);
            //$A.get('e.force:refreshView').fire();
        });
        alert("Data Inserted");
        $A.enqueueAction(actionContract,false);
    }
})