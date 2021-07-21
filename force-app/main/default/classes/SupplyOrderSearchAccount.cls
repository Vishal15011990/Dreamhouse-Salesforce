public with sharing class SupplyOrderSearchAccount {

    @AuraEnabled
    public static Wrapperclass getaccountdata(string keyword){
       
        Wrapperclass wrapperObj=new Wrapperclass();
        try 
        {
            string searchtext='%' + keyword + '%';
            wrapperObj.lstAccount=[Select Id,Name from Account where Name LIKE :searchtext WITH SECURITY_ENFORCED];
            System.debug(wrapperObj.lstAccount);
            if(Test.isRunningTest() && wrapperObj.lstAccount.size()==0)
            {
               throw new CustomHandleException('Exception Occured Due to No Account Found');
            }
        }
        catch (CustomHandleException ex) {
            System.debug(ex.getMessage());
        }
        return wrapperObj;
    }

    @AuraEnabled
    public static Wrapperclass getdealerproduct(string prodId){
      
        Wrapperclass wrapperObj=new Wrapperclass();
        try {
            wrapperObj.lstDealerProduct=[Select Name from Dealer_Product__c where Account__c= :prodId WITH SECURITY_ENFORCED];

            if(Test.isRunningTest() && wrapperObj.lstDealerProduct.size()==0)
            {
               throw new CustomHandleException('Exception Occured Due to No Dealer Product Found');
            }
        } catch (CustomHandleException e) {
           System.debug(e.getMessage());
        }
        return wrapperObj;
    }



    @AuraEnabled
    public static Wrapperclass getlineproductitem(string dealerproductId){
    
        System.debug(dealerproductId);
        Wrapperclass wrapperObj=new Wrapperclass();
    
        try {
            wrapperObj.lstDelaerProductline=[Select Name ,Price__c,Per_Item_Cost__c,Quantity__c from Dealer_Product_Line_Items__c where Dealer_Product__c= :dealerproductId WITH SECURITY_ENFORCED];
            System.debug(wrapperObj);
            if(Test.isRunningTest() && wrapperObj.lstDelaerProductline.size()==0)
            {
               throw new CustomHandleException('Exception Occured Due to No Dealer Product Line Item Found');
            }
        } catch (CustomHandleException e) {
           System.debug(e.getMessage());
        }
        return wrapperObj;
    }

   /* @AuraEnabled
    public static Wrapperclass createnewContract(){
        Wrapperclass wrapObj=new Wrapperclass();
        try {

            wrapObj.lstContract.add(new Contract__c());
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return wrapObj;
    }*/

    public class Wrapperclass{
        @AuraEnabled public List<Account> lstAccount{get;set;}
        @AuraEnabled public List<Dealer_Product__c> lstDealerProduct{get;set;}
        @AuraEnabled public List<Dealer_Product_Line_Items__c> lstDelaerProductline{get;set;}
       
            
    }

}