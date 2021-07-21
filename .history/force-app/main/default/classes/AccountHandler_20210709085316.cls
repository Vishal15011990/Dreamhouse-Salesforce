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

     public static void insertAccount(Integer numAccts) {
        
        List<Account> addAccounts = new List<Account>();
        
        Integer counter = 1;
        
        while(counter <= 3) {
            System.debug('Counter Value before Incrementing ' + counter);
            
            Account a = new Account();
            a.Name = 'Acme Inc ' + counter;
            a.AccountNumber = 'A000' + counter;
            
            addAccounts.add(a);
            System.debug(addAccounts);
            
            counter++;
            System.debug('Counter Value after incrementing ' + counter);
        }
        
        System.debug('Size of Account List: ' + addAccounts.size() );
        System.debug('Elements in Account List: ' + addAccounts);
        
        insert(addAccounts);
    }
}