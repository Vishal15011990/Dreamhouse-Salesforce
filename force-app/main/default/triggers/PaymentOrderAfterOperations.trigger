trigger PaymentOrderAfterOperations on Payment_Order__c (before insert,before update) 
{
    if(trigger.isBefore && trigger.isInsert)
    {
        System.debug('Inserted Successfully');
        PaymentOrderHandler.beforeinsertpaymentorder(Trigger.new);
    }
    else if(trigger.isBefore &&trigger.isUpdate)
    {
        System.debug('Updated Successfully');
        PaymentOrderHandler.afterupdatepaymentorder(Trigger.new,Trigger.oldMap);
    }
}