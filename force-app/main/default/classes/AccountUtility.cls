public with sharing class AccountUtility {
public static void viewAnnualRevenue()
    {
        List<Account> accountsList=[Select Name,AnnualRevenue from Account];
        for(Account accountList:accountsList)
        {
            String acctRev = 'account name: ' + accountList.Name + ', Annual Revenue: ' + accountList.AnnualRevenue;
            System.debug(acctRev);
        }

    }
}