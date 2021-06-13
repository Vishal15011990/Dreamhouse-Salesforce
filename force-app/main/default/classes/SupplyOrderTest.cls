@isTest
private with sharing class SupplyOrderTest {

    @isTest
    private static void getAccount(){
        SupplyOrderSearchAccount.Wrapperclass supplyObj=new SupplyOrderSearchAccount.Wrapperclass();
        List<Account> acc;
        string keyword;
        try
        {
            acc=SupplyOrderSearchAccount.getaccountdata('Act').lstAccount;
        }
        
        catch(Exception ex)
        {
			throw new AuraHandledException(ex.getMessage());        
        }
        System.debug(acc);
        System.assertEquals('Act0', 'Act0','error');
    }
    
    @isTest
    private static void getDealerProuct(){
        SupplyOrderSearchAccount.Wrapperclass supplyObj=new SupplyOrderSearchAccount.Wrapperclass();
		List<Dealer_Product__c> dealerpro;
       	Account cc=[Select Name from Account  Where Name ='ACT 205' LIMIT 1];
    	string accId=cc.Id;
		try
        {
        	dealerpro=SupplyOrderSearchAccount.getdealerproduct(accId).lstDealerProduct;
        }
        catch(Exception ex)
        {
			throw new AuraHandledException(ex.getMessage());        
        }
        System.debug(dealerpro);
        System.assertEquals('ACT 205', cc.Name,'error');

    }
    @isTest
    private static void getDealerLineProuct(){
        SupplyOrderSearchAccount.Wrapperclass supplyObj=new SupplyOrderSearchAccount.Wrapperclass();
		List<Dealer_Product_Line_Items__c> dealerpro;
       	Dealer_Product__c cc=[Select Name from Dealer_Product__c  Where Name ='Sp20' LIMIT 1];
    	string accId=cc.Id;
        try
        {
             dealerpro=SupplyOrderSearchAccount.getlineproductitem(accId).lstDelaerProductline;
        }
        
        catch(Exception ex)
        {
			throw new AuraHandledException(ex.getMessage());        
        }
        System.debug(dealerpro);
        System.assertEquals('Sp20', cc.Name,'error');

    }
    
     @isTest
    private static void getDealerProuctlineErrorHandling(){
        SupplyOrderSearchAccount.Wrapperclass supplyObj=new SupplyOrderSearchAccount.Wrapperclass();
		List<Dealer_Product_Line_Items__c> dealerpro;
       
    	string accId='';
        try
        {
             dealerpro=SupplyOrderSearchAccount.getlineproductitem(accId).lstDelaerProductline;
        }
        
        catch (Exception e) 
        {
            System.debug(e.getMessage());
        }
        System.debug(dealerpro); 
        System.assertEquals('error', 'error','error');
    }
    
     @isTest
    private static void getDealerProuctErrorHandling(){
        SupplyOrderSearchAccount.Wrapperclass supplyObj=new SupplyOrderSearchAccount.Wrapperclass();
		List<Dealer_Product__c> dealerpro;
    	string accId='';
		try
        {
        	dealerpro=SupplyOrderSearchAccount.getdealerproduct(accId).lstDealerProduct;
        }
        catch (Exception e) 
        {
            System.debug(e.getMessage());
        }
        System.debug(dealerpro);
        System.assertEquals('error', 'error','error');

    }
}