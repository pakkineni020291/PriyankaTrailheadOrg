@isTest
public class AccountProcessorTest {
    @isTest static void testCount(){
        
        Test.startTest();
        List<ID> AccId = new List<Id> ();
        //create an account
        Account a = new Account(Name = 'TestAccount');
        insert a;
        AccId.add(a.id);
        contact c = new Contact(AccountID = a.id, LastName = 'Test' );
        insert c;
        AccountProcessor.countContacts(AccId);
        Test.stopTest();
        system.debug('number of contacts:' +[SELECT Number_of_Contacts__c FROM Account WHERE Id =: a.id].Number_of_Contacts__c);
    }
}