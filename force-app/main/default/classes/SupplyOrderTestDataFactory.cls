@isTest
public with sharing class SupplyOrderTestDataFactory {

    @testVisible
    private static void supplyordermanagement(Integer accountCount,Integer dealerproductCount,Integer dealerproductlineCount){

        List<Account> acc=new List<Account>();
        try {
          
        if(accountCount!=null && dealerproductCount!=null && dealerproductlineCount!=null)
        {
            for(Integer i=0;i<accountCount;i++)
            {
                Account accnt=new Account(Name='Acc'+i);
                acc.add(accnt);
                
            }
            insert acc;
            List<Dealer_Product__c> dproduct=new List<Dealer_Product__c>();
            for(Integer k=0;k<accountCount;k++)
            {
                Account newAct=acc[k];
                for(Integer j=0;j<dealerproductCount;j++)
                {
                    dproduct.add(new Dealer_Product__c(Account__c=newAct.Id,Name='Sp20'+j));
                }
            }
            insert dproduct;
            List<Dealer_Product_Line_Items__c> dproductlineItem=new List<Dealer_Product_Line_Items__c>();
            for(Integer l=0;l<dealerproductCount;l++)
            {
                Dealer_Product__c dplist=dproduct[l];
                for(Integer m=0;m<dealerproductlineCount;m++)
                {
                    dproductlineItem.add(new Dealer_Product_Line_Items__c(Dealer_Product__c=dplist.Id,Name='DPL10'+m,Quantity__c=m));
                    
                }
            }
            insert dproductlineItem;
            System.debug(dproductlineItem);
              
        } 
    }
    catch (Exception ex) {
        System.debug('Error Found During fetching SOQL query as Name field is not available: '+ ex.getMessage());
         }
    }
}