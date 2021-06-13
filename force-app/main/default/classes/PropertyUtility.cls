public with sharing class PropertyUtility {
    public static void newListedProperties()
    {
        List<Property__c> newPropList=[Select Name,Broker__r.Email__c from Property__c where Days_On_Market__c < 31];
        for(Property__c p:newPropList)
        {
            String propEmail = 'Property Name: ' + p.Name + ', Broker Email: ' + p.Broker__r.Email__c;
            System.debug(propEmail);
        }

    }
}