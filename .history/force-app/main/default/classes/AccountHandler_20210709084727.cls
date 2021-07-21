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
        
        if(accName!=''){    
            try{
                Account a = new Account(Name=accName);
                insert a;
                System.debug('Bravo Andrè! Account created');
                return a;
            } catch(Exception e){
                System.Debug('Account not created');
                return null;
            }
        } else {
            return null;
        } 
    }    
}