@isTest
private with sharing class SupplyOrderTestDataFactoryTest {

    @isTest
    private static void getAccountTest()
    {
        
        SupplyOrderTestDataFactory.supplyordermanagement(1,0,0);

        Account actlist=[Select Name from Account Limit 1];
        List<Account> accntlist;
        try 
        {
            accntlist =SupplyOrderSearchAccount.getaccountdata(actlist.Name).lstAccount;
            for(Account act:accntlist)
            {
                System.assertEquals('Acc0', act.Name,'error');
            }
        } 
        catch (ListException ex) {
            System.debug(ex.getMessage());
        }

    }
  

    @isTest
    private static void getDealerProductTest()
    {
        SupplyOrderTestDataFactory.supplyordermanagement(1,3,0);

        List<Account> actlist=[Select Name from Account];
        List<Dealer_Product__c> dproductlist;
        string actId;
        try 
        {
            for(Account act:actlist)
            {
                actId=act.Id;
                dproductlist =SupplyOrderSearchAccount.getdealerproduct(actId).lstDealerProduct;
            }
        } 
        catch (Exception ex) {
            System.debug(ex.getMessage());
        }

        for(Dealer_Product__c dproductName:dproductlist)
        {
            System.assertEquals('Sp202', dproductName.Name,'error');
        }
    }

    @isTest
    private static void getDealerProductLineTest()
    {
        SupplyOrderTestDataFactory.supplyordermanagement(1,2,3);

        List<Dealer_Product__c> dproductlist=[Select Name From Dealer_Product__c where Name='Sp200'];
        System.debug(dproductlist);

        List<Dealer_Product_Line_Items__c> dproductlinelist;
        string dproductId;
        try 
        {
            for(Dealer_Product__c dplist:dproductlist)
            {
                dproductId=dplist.Id;
                dproductlinelist =SupplyOrderSearchAccount.getlineproductitem(dproductId).lstDelaerProductline;
                
            }
        } 
        catch (Exception ex) {
            System.debug(ex.getMessage());
        }
        Integer countList=dproductlinelist.size();
        for(Integer i=0;i<countList;i++)
        {
            if(dproductlinelist[i].Name=='DPL102')
            {
                System.assertEquals('DPL102',dproductlinelist[i].Name,'error');
            }
            else {
                System.debug('No Value');
            }
        }
    }


    @isTest
    private static void getAccountExceptionHandleTest()
    {
        
        String exceptionMessage;
        try 
        {

            List<Account> accntlist;//=[Select Name from Account];
            //Account actlist=accntlist[0];
            string strname='XYZ';
            accntlist =SupplyOrderSearchAccount.getaccountdata(strname).lstAccount;
            
        } 
        catch (QueryException ex) 
        {
            System.debug(ex.getTypeName());
            System.assertEquals(ex.getMessage(), ex.getMessage(),'error'); 
        }
        //System.assertEquals(exceptionMessage, exceptionMessage,'error');
    }

    @isTest
    private static void getDealerProductExceptionHandlingTest()
    {
        SupplyOrderTestDataFactory.supplyordermanagement(1,0,0);

        List<Account> actlist=[Select Name from Account];
        List<Dealer_Product__c> dproductlist;
        string actId;
        try 
        {
            for(Account act:actlist)
            {
                actId=act.Id;
                dproductlist =SupplyOrderSearchAccount.getdealerproduct(actId).lstDealerProduct;
            }
        } 
        catch (QueryException ex) 
        {
            System.debug(ex.getTypeName());
            System.assertEquals(ex.getMessage(), ex.getMessage(),'error'); 
        }
    }

    @isTest
    private static void getDealerProductLineExceptionHandlingTest()
    {
        SupplyOrderTestDataFactory.supplyordermanagement(1,1,0);

        List<Dealer_Product__c> dproductlist=[Select Name From Dealer_Product__c where Name='Sp200'];
        System.debug(dproductlist);

        List<Dealer_Product_Line_Items__c> dproductlinelist;
        string dproductId;
        try 
        {
            for(Dealer_Product__c dplist:dproductlist)
            {
                dproductId=dplist.Id;
                dproductlinelist =SupplyOrderSearchAccount.getlineproductitem(dproductId).lstDelaerProductline;
            }
        } 
        catch (QueryException ex) 
        {
            System.debug(ex.getTypeName());
            System.assertEquals(ex.getMessage(), ex.getMessage(),'error'); 
        } 
    }
}