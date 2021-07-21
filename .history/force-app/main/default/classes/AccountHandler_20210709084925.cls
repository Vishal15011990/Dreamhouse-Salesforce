/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-09-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   07-09-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public with sharing class AccountHandler {

    public  Account insertNewAccount (String accName){
        
        List<Account> addAccounts = new List<Account>();
        
        Integer counter = 1;
        
        while(counter <= 3) {
            
            Account a = new Account();
            a.Name = 'Acme Inc ' + counter;
            a.AccountNumber = 'A000' + counter;
            
            addAccounts.add(a);
            
            counter++;
            
        }
        
            if(addAccounts.size() > 0) {
            
            Database.insert(addAccounts);
        }
    }    
}