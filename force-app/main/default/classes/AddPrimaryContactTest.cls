@isTest
public class AddPrimaryContactTest
{
      private static testmethod void testCont()    {
         String state = 'CA';
         List<account> alist =  new List<account>();
         for(Integer i=0;i<50;i++){
          Account acc = new account();
          acc.BillingState = 'CA';
          acc.name = 'Test'+i;
          alist.add(acc);
         }
        // insert alist ;
         for(Integer j=0;j<50;j++){
          Account acc = new account();
          acc.BillingState = 'SFO';
          acc.name = 'Test'+j;
          alist.add(acc);
         }
         insert alist ;
         Contact c = new contact();
         c.FirstName = 'FirstName';
         c.LastName = 'LastName';
         insert c;
         AddPrimaryContact apc = new AddPrimaryContact(c, state);
         Test.startTest();
         System.enqueueJob(apc);
         Test.stopTest();
         System.assertEquals(50, [select count() from Contact where accountID IN (SELECT id FROM Account WHERE BillingState = :State)]);  
      }
}