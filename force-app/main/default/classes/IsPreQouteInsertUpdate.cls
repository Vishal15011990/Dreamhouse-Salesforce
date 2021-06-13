public with sharing class IsPreQouteInsertUpdate {
    public static void beforeInsert(List<Pre_Quote__c> prelist)
    {  
        list<Qoute__c> updateqouteList = new list<Qoute__c>();


        for(Pre_Quote__c preqoutelist : prelist){
            
                Qoute__c listQoute = new Qoute__c();
                // listQoute.Total_Dealer_commission__c= integer.valueof(totcom);
                // listQoute.Average_Dealer_Commision__c=integer.valueof(avgcom);

                updateqoutelist.add(listQoute);
           
        }
         insert updateqouteList;

    }


    // public static void beforeUpdate(List<Pre_Quote__c> prelist)
    // {
    //     List<Qoute__c> updateQoutelist=new List<Qoute__c>();

    //     Pre_Quote__c preQoutelist = [select id ,Name ,Billed_Cost__c,Dealer_Commission__c from Pre_Quote__c];
    //     List<Qoute__c> listQoute= new List<Qoute__c>([select id from Qoute__c where Name=:preQoutelist.Name limit 1]);
    //     for(Pre_Quote__c cust : prelist){
    
    //             listQoute[0].Total_Dealer_commission__c= (cust.Billed_Cost__c*cust.Dealer_Commission__c)/100;
    //             listQoute[0].Average_Dealer_Commision__c=listQoute[0].Total_Dealer_commission__c/12;
    
    //             updateQoutelist.add(listQoute[0]);
           
    //     }
    //      update updateQoutelist;
    // }
}