public with sharing class PaymentUpdateOrderOperation {

    public static List<Payment_Order__c> paymentorderupdate(List<Payment_Order__c> newupdatedpaylist,Map<Id,Payment_Order__c> oldpaymentorderedmap)
    {
        Set<Id> idlistofaccount=new Set<Id>();

        List<Account> acctlistwithrelatedpaymentorderlist=[Select Id from Account ];
        for(Account updatedlistofid:acctlistwithrelatedpaymentorderlist)
        {
            idlistofaccount.add(updatedlistofid.Id);
        }

        List<Payment_Order__c> oldpaymentlistwithaccount=[Select Id,Account__c,Payee_Name__c,
                                                            Phone_No__c,Address_Street_1__c,
                                                            Address_Street_2__c,Zip__c,Country__c,
                                                            State__c from Payment_Order__c 
                                                            where Account__c=:idlistofaccount
                                                            ];

        Boolean getstatusforpaymentrecordequalforeachaccount=getvalidateaccountrecordwithupdatedpaymentorderlist(oldpaymentlistwithaccount,newupdatedpaylist);
        Boolean getstatusforupdatedpaymentrecordnotequaloldrecord=getvalidateupdatedpaymentrecordwitholdpaymentrecord(newupdatedpaylist,oldpaymentorderedmap);
        Payment_Order__c newupdatedpayorderlist;
        
        if(getstatusforpaymentrecordequalforeachaccount!=false)
        {
            for(Payment_Order__c paytobeupdated:newupdatedpaylist)
            {
                if(getstatusforupdatedpaymentrecordnotequaloldrecord!=false)
                {
                    List<Account> account=PaymentInsertOrderOperation.createaccountforpayment();
                    for(Account acctId:account)
                    {
                        if(paytobeupdated.Payment_Amount__c!=null)
                        {
                            Payment_Order__c checkpaymentstatus=PaymentInsertOrderOperation.checkpaymentstatuswithpayment(paytobeupdated); 
                            paytobeupdated.Payment_Status__c=checkpaymentstatus.Payment_Status__c;
                            createpaymentordercontextbasedonaccountid(acctId,paytobeupdated);
                        }
                        else
                        {
                            createpaymentordercontextbasedonaccountid(acctId,paytobeupdated);
                        }
                    }
                }
            }
        }
        return newupdatedpaylist;
    }

    public static Boolean getvalidateaccountrecordwithupdatedpaymentorderlist(List<Payment_Order__c> accoountdatawithallpaymentorderlist,List<Payment_Order__c> updatedpaymentlist)
    {
        Boolean status=false;
        for(Payment_Order__c paymentorderlisttocheck:updatedpaymentlist)
        {
            for(Payment_Order__c acctcheckpayment:accoountdatawithallpaymentorderlist)
            {
                if(paymentorderlisttocheck.Payee_Name__c!=acctcheckpayment.Payee_Name__c||paymentorderlisttocheck.Phone_No__c!=acctcheckpayment.Phone_No__c||paymentorderlisttocheck.Address_Street_1__c!=acctcheckpayment.Address_Street_1__c||paymentorderlisttocheck.Address_Street_2__c!=acctcheckpayment.Address_Street_2__c||paymentorderlisttocheck.Zip__c!=acctcheckpayment.Zip__c||paymentorderlisttocheck.Country__c!=acctcheckpayment.Country__c||paymentorderlisttocheck.State__c!=acctcheckpayment.State__c)
                {
                    status= true;
                }
            }
        }
        return status;
    }

    public static Boolean getvalidateupdatedpaymentrecordwitholdpaymentrecord(List<Payment_Order__c> updatedpaymentrecordvalue,Map<Id,Payment_Order__c> oldpaymentrecordmap)
    {
        Boolean status=false;
        for(Payment_Order__c paytobeupdated:updatedpaymentrecordvalue)
        {
            if(paytobeupdated.Account__c!=null 
            &&(paytobeupdated.Payee_Name__c !=oldpaymentrecordmap.get(paytobeupdated.Id).Payee_Name__c
            ||paytobeupdated.Phone_No__c!=oldpaymentrecordmap.get(paytobeupdated.Id).Phone_No__c
            ||paytobeupdated.Address_Street_1__c!=oldpaymentrecordmap.get(paytobeupdated.Id).Address_Street_1__c
            ||paytobeupdated.Address_Street_2__c!=oldpaymentrecordmap.get(paytobeupdated.Id).Address_Street_2__c
            ||paytobeupdated.Zip__c!=oldpaymentrecordmap.get(paytobeupdated.Id).Zip__c
            ||paytobeupdated.Country__c!=oldpaymentrecordmap.get(paytobeupdated.Id).Country__c
            ||paytobeupdated.State__c!=oldpaymentrecordmap.get(paytobeupdated.Id).State__c))
            {
                status=true;
            }
        }
        return status;
    }



    public static Payment_Order__c createpaymentordercontextbasedonaccountid(Account acct,Payment_Order__c updatedpaymentlist)
    {
        String randomstringgenerator=PaymentInsertOrderOperation.generateRandomString(2,'123456');
        System.debug(updatedpaymentlist.Address_Street_1__c);
        Payment_Order__c payordercontext=new Payment_Order__c(RecordTypeId=updatedpaymentlist.RecordTypeId,
                                                                Name='Pay-Acc-'+randomstringgenerator,
                                                                Account__c=acct.Id,
                                                                Payee_Name__c=updatedpaymentlist.Payee_Name__c,
                                                                Phone_No__c=updatedpaymentlist.Phone_No__c,
                                                                Address_Street_1__c= updatedpaymentlist.Address_Street_1__c,
                                                                Address_Street_2__c=updatedpaymentlist.Address_Street_2__c,
                                                                Zip__c= updatedpaymentlist.Zip__c,
                                                                Country__c= updatedpaymentlist.Country__c,
                                                                State__c=updatedpaymentlist.State__c
                                                                );
                                                    
        insert payordercontext;
        return payordercontext;
    }
}