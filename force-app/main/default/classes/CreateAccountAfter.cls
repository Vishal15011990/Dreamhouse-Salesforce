public with sharing class CreateAccountAfter {
    public static void insertandcreateanotheraccount(List<Account> listaccount) 
    {
        List<Account> addlist=new List<Account>();
        for(Account acc:listaccount)
        {
            if(CheckRecursive.executeonce==true)
            {    
                Account act=new Account();
                act.Name='Child Account-'+act.Name;
                act.ParentId=acc.Id;
                addlist.add(act);
                CheckRecursive.executeonce=false;
            }
        }
        insert addlist;
    }
}