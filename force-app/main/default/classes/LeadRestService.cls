@RestResource(urlMapping = 
'/LeadService/*')
global with sharing class LeadRestService{
	@httpget
	global static List<Lead> getleadinfo(){
		RestRequest req = RestContext.request;
		RestResponse res = RestContext.response;
		System.debug('req' + req.requestURI);

		string requestURI = req.requestURI;
		string strName = '%' + requestURI.substring(requestURI.lastIndexOf('=')+1)+'%'; //Finds the  last index of the url and matching

		List<Lead> leadlist = [Select Id, Name, Email, Phone, Company, MobilePhone
		                       from Lead
		                       where Name LIKE :strName];
		return leadlist;
	}

	@httpDelete
	global static string deleteMatchingLead(){

		string responseMessage;
		integer leadCount = 0;

		try{
			RestRequest req = RestContext.request;
			RestResponse res = RestContext.response;
			system.debug('req.requestURI' + req.requestURI);

			string requestURI = req.requestURI;
			string leadName = '%' + requestURI.substring(requestURI.lastIndexOf('=')+1)+'%';
			system.debug('leadName' + leadName);

			List<lead> leadlist = [SELECT Id, Name, Email, Phone, Company, MobilePhone
			                       from lead
			                       where Name like :leadName WITH SECURITY_ENFORCED];

			if (leadlist != NULL && leadlist.size() > 0){
				leadCount = leadlist.size();
			}
			delete leadlist;
		} catch (Exception ex){
			responseMessage = 'Exception occured during delete =>' + ex.getMessage();
		}

		responseMessage = 'Lead deleted sucesfully => lead deleted count : ' + leadCount;
		return responseMessage;
	}

    @httpPost
    global static string createNewLead(string fname,string lname,string cname,string leademail,string leadphoneNumber){
        string responseMessage;
        try {
            Lead L=new Lead();
            L.FirstName=fname;
            L.LastName=lname;
            L.Company=cname;
            L.Email=leademail;
            L.Phone=leadphoneNumber;
            insert L;
            responseMessage='Lead created successfully Id as :'+l.Id;
        } catch(Exception e) {
            responseMessage='Error occured during new lead creation= >'+e.getMessage();
        }
        return responseMessage;
    }


    @httpPatch
    global static string updateNewLead(string newEmail){
        string responseMessage;
        try {
            RestRequest req = RestContext.request;
            string requestURI = req.requestURI;
            string leadid=requestURI.substring(requestURI.lastIndexOf('=')+1);

            lead mylead = [Select id,email from lead where id=:leadid];
           
            if(mylead!=NULL && mylead.Email !=newEmail){
                string oldemail = mylead.Email;
                mylead.email = newEmail;
                update mylead;
                responseMessage = 'Lead updated from old email '+oldemail +' with new email as '+newEmail;
            }
            else{
                responseMessage = 'Currently this lead is having same email address '+newEmail;
            }
        }
        catch(Exception ex){
            responseMessage ='Exception occured during lead update '+ex.getMessage();
        }
        return responseMessage;
    }
}