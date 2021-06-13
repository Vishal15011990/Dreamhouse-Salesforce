public with sharing class Contactlist {
    
    @AuraEnabled
    public static List<Contact> getContact(string aid)
    {
        List<Contact> con=[SELECT Id,LastName,FirstName,Email,Phone  FROM Contact where AccountId=:aid WITH SECURITY_ENFORCED];
        return con;
    }

    @AuraEnabled
    public static Contact insertContact(Contact con,string accid)
    {
        con.AccountId=accid;
        insert con;
        return con;
    }
}