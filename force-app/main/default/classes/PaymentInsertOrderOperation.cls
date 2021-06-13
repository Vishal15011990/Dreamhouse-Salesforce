public with sharing class PaymentInsertOrderOperation 
{
    public static List<Payment_Order__c> paymentorderinsertdata(List<Payment_Order__c> newpaylist)
    {
        List<Payment_Order__c> paymentorderinserted=new List<Payment_Order__c>();
        List<Payment_Order__c> payorderinserted=new List<Payment_Order__c>();
        try 
        {
            String type=null;
            Map<ID, Schema.RecordTypeInfo> rtMap = Schema.SObjectType.Payment_Order__c.getRecordTypeInfosById();
            for (Payment_Order__c o : newpaylist) 
            {
                type = rtMap.get(o.RecordTypeId).getName();
            }
            System.debug(type);
             payorderinserted=getvalidatedpayorderandinsert(newpaylist,type);
        } 
        catch (Exception ex) {
            System.debug('Due to '+ex.getCause()+'Error message'+ex.getMessage());
        }
        return paymentorderinserted;
    }

    public static List<Payment_Order__c> getvalidatedpayorderandinsert(List<Payment_Order__c> newpaylist,String type)
    {
        String randomstringgeneratorforall='';
        List<Payment_Order__c> payorderinserted=new List<Payment_Order__c>();

            for(Payment_Order__c payincontext:newpaylist)
            {
                if(type=='Payment Order US')
                {
                    if(payincontext.Account__c!=null)
                    {
                        Payment_Order__c checkpaymentstatus=checkpaymentstatuswithpayment(payincontext);
                        randomstringgeneratorforall=generateRandomString(2,'123456');
                        payincontext.Payee_Name__c='Pay-'+randomstringgeneratorforall;
                        payincontext.Phone_No__c='9007324931';
                        payincontext.Address_Street_1__c='Street';
                        payincontext.Address_Street_2__c='Near West Coast';
                        payincontext.Zip__c='799021';
                        payincontext.Country__c='US';	
                        payincontext.State__c='Northern';
                        checkpaymentstatus.Payment_Status__c='Pending Approval';
                    }
                    else 
                    {
                        payincontext.addError('Kindly Enter Account Record to Save the Payment Record');
                    }
                }
                else
                {
                    if(payincontext.Account__c==null)
                    {
                        List<Account> account=createaccountforpayment();
                        randomstringgeneratorforall=generateRandomString(2,'123456');
                        payincontext.Payee_Name__c='Paye-Acc' +randomstringgeneratorforall;
                        payincontext.Phone_No__c='9007324931';
                        payincontext.Address_Street_1__c='Norther Street';
                        payincontext.Address_Street_2__c='Near West Coast';
                        payincontext.Zip__c='799021';
                        payincontext.Country__c='Europe';	
                        payincontext.State__c='Norther';
                        for(Account acctId:account)
                        {
                            payincontext.Account__c=acctId.Id;
                        }
                    }
                }
                payorderinserted.add(payincontext);
            }
        return payorderinserted;
    }

    public static List<Account> createaccountforpayment()
    {
        String randomstringgeneratorforall=generateRandomString(2,'123456');
        Account acct=new Account(Name='Acct-Pay-'+randomstringgeneratorforall);
        insert acct;

        List<Account> acctnewaccountcreatedforpayment=new List<Account>();
        acctnewaccountcreatedforpayment.add(acct);
         return acctnewaccountcreatedforpayment;
    }

    public static String generateRandomString(Integer len,String charsrandom) 
    {
        final String chars = charsrandom;
        String randStr = '';
        while (randStr.length() < len) {
        Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), chars.length());
        randStr += chars.substring(idx, idx+1);
        }
        return randStr;
    } 


    public static Payment_Order__c checkpaymentstatuswithpayment(Payment_Order__c checkpaymentevaluation)
    {
        if(checkpaymentevaluation.Payment_Amount__c!=null && checkpaymentevaluation.Payment_Amount__c >2000)
        {
            checkpaymentevaluation.Payment_Status__c='Pending Approval';
        }
        return checkpaymentevaluation;
    }
}