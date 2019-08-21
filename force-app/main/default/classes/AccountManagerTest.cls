@IsTest
private class AccountManagerTest{
    @isTest static void testGetCaseById() {
    
        Account acc = new account(name = 'test account');
        insert acc;
        Contact con = new Contact (lastname = ' test contact', AccountId = acc.id);
        insert con;
        
        Id recordId = acc.id;
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://pakkineni-dev-ed.my.salesforce.com/services/apexrest/Accounts/'
            + recordId+'/Contacts/';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount= AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount!= null);
        System.assertEquals('test account', thisAccount.name);
    }
          
}