public with sharing class PreQouteHandler 
{
public static void afterInsertPreQoute(List<Pre_Quote__c> prelist)
    {
       
        List<Qoute__c> qtList=new List<Qoute__c>();
        Set<Id> qoutesId=new Set<Id>();  
  
        for(Pre_Quote__c qoute:prelist)
        {
            if(qoute.Qoute__c!=null)
            {
                qoutesId.add(qoute.Qoute__c);
            }
        }
        qtList=calculatetotalaveragecommission(qoutesId);
        if(!qtList.isEmpty())
        {
            update qtList;
        }
    }

    public static void afterUpdatePreQoute(List<Pre_Quote__c> prelist,Map<Id,Pre_Quote__c> mappreqouteoldlist)
    {
        List<Qoute__c> qtList=new List<Qoute__c>();
        Set<Id> qoutesId=new Set<Id>();  
  
        for(Pre_Quote__c qoute:prelist)
        {
            if(qoute.Qoute__c!=null && qoute.Dealer_Commission__c!=mappreqouteoldlist.get(qoute.Id).Dealer_Commission__c){ 
                qoutesId.add(qoute.Qoute__c);
            }
        }
        qtList=calculatetotalaveragecommission(qoutesId);
        if(!qtList.isEmpty())
        {
            update qtList;
        }
    }

public static void afterundeletepreqoute(List<Pre_Quote__c> prelist){
    List<Pre_Quote__c> undoList=new List<Pre_Quote__c>();
    for(Pre_Quote__c cotlist:prelist){
        if(cotlist.Name!=null)
        {
            undoList.add(new Pre_Quote__c(id=cotlist.Id,Name=cotlist.Name));
        }
    }

        update undoList;    
        System.debug('Undeleted Successfully');

    }


    public static List<Qoute__c> calculatetotalaveragecommission(Set<Id> qouteIds)
    {
        Decimal totalcommision=0;
        Decimal totalpreQoutes=0;
        Qoute__c newQoute=new Qoute__c();
        List<Qoute__c> qoutestoUpdate =new List<Qoute__c>();
        // if(!qouteIds.isEmpty())
        // {
            qoutestoUpdate=[Select Id ,Total_Dealer_commission__c,Average_Dealer_Commision__c from Qoute__c where Id =:qouteIds WITH SECURITY_ENFORCED];
            List<Pre_Quote__c> preqoutestoupdate=[Select Id,Dealer_Commission__c from Pre_Quote__c  where Qoute__c =:qouteIds WITH SECURITY_ENFORCED];

            for(Qoute__c qoute:qoutestoUpdate)
            {
                for(Pre_Quote__c newpreqoute:preqoutestoupdate)
                {
                    totalcommision+=newpreqoute.Dealer_Commission__c;
                    totalpreQoutes++;
                }
                if(totalpreQoutes>0)
                {
                    qoute.Total_Dealer_commission__c=totalcommision;
                    qoute.Average_Dealer_Commision__c=totalcommision/totalpreQoutes;
                }
            }
       // }
        return qoutestoUpdate;
    }
}