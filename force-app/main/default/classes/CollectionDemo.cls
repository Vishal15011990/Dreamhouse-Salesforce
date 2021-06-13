public class CollectionDemo {

    public void listCollectionDemo(){
               
       /* List<Contact> lstContact= [Select Name from Contact  LIMIT 300];
        System.debug('Value of Contact List are: '+ lstContact); */
        
        List<String> cust_list=new List<String>();
        cust_list.add('Vishal');			  //----------0
        cust_list.add('Nevas');		   		 //----------1
        cust_list.add('Akshay');        	//----------2
        cust_list.add('Leela');        	   //----------3
        
         String Name=cust_list.get(0);
        
        System.debug('List Values are :' +cust_list);
        System.debug('Name is : '+Name);
        
        List<String> lstClone=new List<String>();
        lstClone=cust_list.clone();   
        System.debug('After Cloning Value for List : ' +lstClone);
        
        cust_list.sort();
        System.debug('After inserting new record: '+ cust_list);
        
        
        cust_list.set(3,'Rehman');
        System.debug('After inserting new record: '+ cust_list);
        
        //lst.remove(3);
        //System.debug('After removing  record: '+ lst);

        //lst.clear();
        //System.debug('After clearing  record: '+ lst);
        
        String i = cust_list.get(0);
        System.debug('Index of Lst: '+ i);
        
	}
    public void setCollectionDemo(){
        
       Set<String> accountSet2 = new Set<String>();
        
      Account a1 = new account(name='MyAccount');
      Account a2 = new account(name='MyAccount', description='My test account');
 
      Set<Account> accountSet = new Set<Account>{a1, a2};
      System.debug('Value of Account Set are: ' + accountSet);       
      
      List<Account> s=new List<Account>(accountSet);
     System.debug('Value for Set is: ' +s.get(0));
	}
    public void mapCollectionDemo(){
        Map<Integer,String> newMap=new Map<Integer,String>();
        newMap.put(1, 'India');
        newMap.put(2, 'Australia');
        newMap.put(3, 'India');
        //newMap.put(3,'America');
        System.debug('Value of Map Set are: ' + newMap);       

	}
}