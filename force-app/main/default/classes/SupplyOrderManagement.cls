public with sharing class SupplyOrderManagement {
    @AuraEnabled
    public static Wrapperclass getaccountdata(string keyword){
       
        Wrapperclass wrapperObj=new Wrapperclass();

        string searchtext='%' + keyword + '%';
         wrapperObj.lstAccount=[Select Id,Name from Account where Name LIKE :searchtext WITH SECURITY_ENFORCED];
        
        return wrapperObj;
    }

    @AuraEnabled
    public static Wrapperclass getdealerproduct(string prodId){
      
        Wrapperclass wrapperObj=new Wrapperclass();
        try {
            wrapperObj.lstDealerProduct=[Select Name from Dealer_Product__c where Account__c= :prodId WITH SECURITY_ENFORCED];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return wrapperObj;
    }

    @AuraEnabled
    public static Wrapperclass getlineproductitem(string dealerproductId){
       
        System.debug(dealerproductId);

        Wrapperclass wrapperObj=new Wrapperclass();
        try {
            //getdealerlineitem=[Select Name ,Dealer_Product_Line_Item__r.Name ,Dealer_Product_Line_Item__r.Price__c,Dealer_Product_Line_Item__r.Per_Item_Cost__c,Dealer_Product_Line_Item__r.Quantity__c from Dealer_Product__c where Id= :dealerId WITH SECURITY_ENFORCED];
            wrapperObj.lstDealerProduct=[Select Id,Name,Account__r.Name,(Select Name,Price__c ,Per_Item_Cost__c,Quantity__c from Dealer_Product_Line_Items__r) from Dealer_Product__c where Id =:dealerproductId WITH SECURITY_ENFORCED];
            System.debug(wrapperObj);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return wrapperObj;
    }

   
    public class Wrapperclass{
        @AuraEnabled public List<Account> lstAccount{get;set;}
        
        @AuraEnabled public List<Dealer_Product__c> lstDealerProduct{get;set;}
        
        @AuraEnabled public List<Dealer_Product_Line_Items__c> lstDelaerProductline{get;set;}

        @AuraEnabled public Integer contactCount{get;set;}
        @AuraEnabled public String headerMsg {get;set;}
    }
}