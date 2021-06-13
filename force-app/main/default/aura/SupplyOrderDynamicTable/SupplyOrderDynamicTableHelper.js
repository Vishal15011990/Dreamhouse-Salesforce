({
    fetchdataitem : function(component,event,helper) {
        
        var total=0;
        var responseResult;

        var action=component.get('c.getlineproductitem');

        var getproductId=document.getElementById("prodselect").value; //        console.log(getproductId);

        var getoldproductlist=component.get('v.DealerProductlist');


        action.setParams({
            'dealerproductId':getproductId
        });

        action.setCallback(this,function(response){
            var stat=response.getState();
            responseResult=response.getReturnValue();       
                       
            var newResponse=responseResult.lstDelaerProductline;

            const map1 = getoldproductlist.map(x => x.Id);
            console.log(map1);

            for(var i=0;i<newResponse.length;i++)
            {
                if(map1.includes(newResponse[i].Id)){
                  
                    let elementPos= getoldproductlist.findIndex((obj => obj.Id == newResponse[i].Id));  
                    getoldproductlist[elementPos].Quantity++;
                    getoldproductlist[elementPos].Price=getoldproductlist[elementPos].Quantity*getoldproductlist[elementPos].PerItemCost;
                    total+=getoldproductlist[elementPos].Price;
                }
                else{
                    getoldproductlist.push({DealerProductId:getproductId,AccountId:component.get('v.dealerId'),AccountName:component.get('v.AccountName'),OrderDate:component.get('v.todaysDate'),Id:newResponse[i].Id,ProductName:newResponse[i].Name,Quantity:newResponse[i].Quantity__c,PerItemCost:newResponse[i].Per_Item_Cost__c,Price:newResponse[i].Price__c});
                    //console.log(getoldproductlist);
                }
            }


                for(var k=0;k<getoldproductlist.length;k++ ){ 
                    total+=getoldproductlist[k].Price;;
                    console.log(total);
                }                

            component.set('v.GrandTotal',total);
            component.set('v.DealerProductlist',getoldproductlist);
           

            var showdatatable=component.find("showdata");
            $A.util.removeClass(showdatatable, "show");
            
            var showbutton= component.find("hidebutton");
            $A.util.removeClass(showbutton, "show");


            component.set('v.MyColumns',[
                {label:'#'},
                {label:'Product Name', fieldName:'ProductName',type:'text'},
                {label:'Per Item Cost', fieldName:'PerItemCost',type:'Number'},
                {label:'Quantity', fieldName:'Quantity',type:'Number',editable: true},
                {label:'Price', fieldName:'Price',type: 'currency', typeAttributes: { currencyCode: 'USD'}},
                
            ]);
        });

        $A.enqueueAction(action,false);
    },
    
})
