@isTest
public with sharing class PreQouteTest
{
    @isTest
    static void testcreatedpreqoute()
    {
       QoutePreQouteTestDataFactory.qoutepreqoutetest(1,2);
       List<Qoute__c> qtlist=[Select Id,Total_Dealer_commission__c,Average_Dealer_Commision__c from Qoute__c];

       for (Qoute__c qouteincontext : qtlist)
        {
            System.assertEquals(10000,qouteincontext.Total_Dealer_commission__c);
        }
    }

    @isTest
    static void testupdatedpreqoute()
    {
        QoutePreQouteTestDataFactory.qoutepreqoutetest(1,2);
        List<Pre_Quote__c> prelistupdate=[Select Id,Qoute__c,Dealer_Commission__c from Pre_Quote__c where Name Like :'Pr%'];
        List<Qoute__c> qouteupdate=[Select Id from Qoute__c where Name Like:'Q%'];
        for(Qoute__c qt:qouteupdate)
        {
            for(Pre_Quote__c preqoute:prelistupdate)
            {
                //Qoute__c qt=new Qoute__c();
                preqoute.Qoute__c=qt.Id;
                preqoute.Dealer_Commission__c=3000;
            }
            
        }
        update prelistupdate;

        List<Qoute__c> qtlist=[Select Id, Total_Dealer_commission__c from Qoute__c ];
        for (Qoute__c qouteincontext : qtlist)
        {
           System.assertEquals(6000,qouteincontext.Total_Dealer_commission__c);
        }
    }

    @isTest
    static void testdeletedpreqoutewithqoute()
    {
        QoutePreQouteTestDataFactory.qoutepreqoutetest(1,1);
        List<Pre_Quote__c> prelistupdate=[Select Id,Qoute__c,Dealer_Commission__c from Pre_Quote__c where Name Like :'Pr%'];
        List<Qoute__c> qouteupdate=[Select Id from Qoute__c where Name Like:'Q%'];
        for(Qoute__c qt:qouteupdate)
        {
            for(Pre_Quote__c preqoute:prelistupdate)
            {
                preqoute.Qoute__c=qt.Id;
                preqoute.Dealer_Commission__c=0;
            }
            
        }
        update prelistupdate;

        List<Qoute__c> qtlist=[Select Id, Total_Dealer_commission__c from Qoute__c ];
        for (Qoute__c qouteincontext : qtlist)
        {
           System.assertEquals(0,qouteincontext.Total_Dealer_commission__c);
           System.debug(qouteincontext.Total_Dealer_commission__c);

        }
    }
}