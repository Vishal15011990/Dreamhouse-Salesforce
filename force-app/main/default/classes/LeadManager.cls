global with sharing class LeadManager {

    webservice static String createNewLead(string leadFirstName,string leadLastName,string leadCompanyName) {
        try {
            Lead ld=new Lead();
            ld.FirstName=leadFirstName;
            ld.LastName=leadLastName;
            ld.Company=leadCompanyName;
            insert ld;
            return ld.Id;
        } 
        catch (Exception ex) {
           return 'Error Occured'; 
        }  
    }
}