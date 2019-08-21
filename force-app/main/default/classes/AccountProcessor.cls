public class AccountProcessor {
  @future
  public static void countContacts(List<Id> AccountIds) {
    List<Account> accounts = [Select Id, Name, Number_of_Contacts__c,(SELECT Id FROM Contacts) from Account Where Id IN :AccountIds];
    /*
    List<Contact> contacts = [SELECT Id, Account.Id FROM Contact WHERE AccountId IN :accountIds];
    List<Account> accToUpdate = new List<Account>();
    Map<Id,Integer> accCntcMap = new Map<Id,Integer>();
    for(Account a : accounts){
      Integer cnt = 0;
      for(Contact c : contacts){
          if(a.id == c.AccountId)
              cnt++;
      }
      accCntcMap.put(a.Id,cnt);
    }
	*/
    // process account records to do awesome stuff
      for( Account a : accounts ){          
          //Integer count = [SELECT count()  FROM Contact WHERE Account.id = :a.id];
          //a.Number_of_Contacts__c = count;
          a.Number_of_Contacts__c = a.Contacts.size();
		  //accToUpdate.add(a);          
          system.debug('Account has been updated');
      }
      update accounts;
  }
}