@isTest
public class LeadProcessorTest {
    @testSetup 
    static void setup() {
        List<lead> leads = new List<lead>();
       
        // insert 10 accounts
        for (Integer i=0;i<10;i++) {
            leads.add(new Lead(lastname ='Lead '+i, 
               leadsource = ' Partner Referral', Company ='New York', Title='USA'));
        }
        insert leads;
    }
    static testmethod void test() {        
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();

        // after the testing stops, assert records were updated properly
        System.assertEquals('Dreamforce', [select id , leadsource from lead where company ='New York'][0].leadsource);
    }

}