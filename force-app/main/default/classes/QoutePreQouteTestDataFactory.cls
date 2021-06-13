@isTest
public with sharing class QoutePreQouteTestDataFactory {

    public static void qoutepreqoutetest(Integer qoutenumber,Integer preqoutenumber){
        Decimal sum=0;
        Integer avg=0;
        List<Qoute__c> qouteList=new List<Qoute__c>();
        if(qoutenumber!=null && preqoutenumber!=null)
        {
        for(Integer i=0;i<qoutenumber;i++){
            Qoute__c insertQoute=new Qoute__c(Name='QT8'+i);
            qouteList.add(insertQoute);
            
        }
        insert qouteList;
        List<Pre_Quote__c> preqoutelist=new List<Pre_Quote__c>();
        for(Integer j=0;j<qoutenumber;j++)
        {
            Integer myvalue=5000;
            Qoute__c qouteobj=qouteList[j];
            for(Integer k=0;k<preqoutenumber;k++){
                preqoutelist.add(new Pre_Quote__c(Qoute__c=qouteobj.Id,Name='Pre'+k,Dealer_Commission__c=myvalue));
            }
        }
        insert preqoutelist;
        }
    }
}