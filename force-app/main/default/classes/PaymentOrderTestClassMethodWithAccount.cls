@isTest
public with sharing class PaymentOrderTestClassMethodWithAccount {
    
    @isTest
    static void paymentorderinsertionwithaccount()
    {
        PaymentOrderTestDataFactory.createUpdatapaymentorderwithaccount(1,1);
        List<Payment_Order__c> paymentlist=[Select Id,Payment_Amount__c,Payment_Status__c from Payment_Order__c];
        for(Payment_Order__c paymentincontext:paymentlist)
        {
            System.assertEquals('Pending Approval',paymentincontext.Payment_Status__c,'Success');
        }
    }
    @isTest
    static void paymentorderinsertionwithoutaccount()
    {
        PaymentOrderTestDataFactory.createUpdatapaymentorderwithaccount(0,1);
        List<Payment_Order__c> paymentlist=[Select Id,Account__c,Name,Payment_Amount__c,Payment_Status__c from Payment_Order__c];
        for(Payment_Order__c paymentincontext:paymentlist)
        {
            System.assert(paymentincontext.Account__c!=null,'true');
            System.debug(paymentincontext.Account__c);
        }
    }
    @isTest
    static void paymentorderupdatewithaccountmatching()
    {
        PaymentOrderTestDataFactory.createUpdatapaymentorderwithaccount(1,1);
        Database.SaveResult dr;
        List<Payment_Order__c> paymentlist=[Select Id,Account__c,Name,Payment_Amount__c,Payment_Status__c,Address_Street_1__c from Payment_Order__c];
        for(Payment_Order__c paymentincontext:paymentlist)
        {
            paymentincontext.Address_Street_1__c='New Jersey Cantonment';
            dr=Database.update(paymentincontext,false);
            System.debug(dr);
        }
        System.assert(dr.isSuccess(),'true');
    }    
}