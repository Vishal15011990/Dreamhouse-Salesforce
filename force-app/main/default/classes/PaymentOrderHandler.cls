public with sharing class PaymentOrderHandler 
{
    public static void beforeinsertpaymentorder(List<Payment_Order__c> newpaymentlist)
    {
        if(newpaymentlist.size()>0)
        {
           Insert PaymentInsertOrderOperation.paymentorderinsertdata(newpaymentlist);
        }
    }

    public static void afterupdatepaymentorder(List<Payment_Order__c> newupdatedpaylist,Map<Id,Payment_Order__c> oldpaymentorderedmap)
    {
        if(newupdatedpaylist.size()>0)
        {
           PaymentUpdateOrderOperation.paymentorderupdate(newupdatedpaylist,oldpaymentorderedmap);
        }
    }
}