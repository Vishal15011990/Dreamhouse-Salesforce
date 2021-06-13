@isTest
public with sharing class PaymentOrderTestDataFactory 
{
    public static void createUpdatapaymentorderwithaccount(Integer accountnumber,Integer paymentorder)
    {
        List<Account> acctinserted=new List<Account>();
        List<Payment_Order__c> paymentorderinserted=new List<Payment_Order__c>();
        Integer myvalue=5000;
        String recordidforus='0125g000000ckcbAAA';
        String recordidforeu='0125g000000ckcgAAA';
        if(accountnumber>0)
        {
            for(Integer i=0;i<AccountNumber;i++)
            {
                Account acc=new Account(Name='Acc-Payment-');
                acctinserted.add(acc);
            }
            insert acctinserted;
            if(acctinserted.size()>0)
            {
                for(Account acc:acctinserted)
                {  
                    
                    for(Integer k=0;k<paymentorder;k++)
                    {
                        if(acc.Id!=null)
                        {
                            paymentorderinserted.add(new Payment_Order__c(Account__c=acc.Id,Name='Pre-Account-'+k,Payment_Amount__c=myvalue,RecordTypeId=recordidforus,Address_Street_1__c='New Jersey'));
                            System.debug(acc.Id);
                        }
                    }
                }
            }
        }
        else 
        {
            paymentorderinserted.add(new Payment_Order__c(Name='Pre-Account-',Payment_Amount__c=myvalue,RecordTypeId=recordidforeu,Address_Street_1__c='New Texas'));

        }
        insert paymentorderinserted;
    }
}