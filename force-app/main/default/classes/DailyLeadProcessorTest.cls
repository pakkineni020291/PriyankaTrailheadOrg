@isTest
    private class DailyLeadProcessorTest{
        // Dummy CRON expression: midnight on March 15.
        // Because this is a test, job executes
        // immediately after Test.stopTest().
        public static String CRON_EXP = '0 0 0 15 3 ? 2022';
        static testmethod void testScheduledJob() {
            // Create some out of date Opportunity records
            List<Lead> Leads = new List<Lead>();
            for (Integer i=0; i<200; i++) {
                Lead Lead = new Lead(Company = 'abc',  LastName ='p', LeadSource = '');
                Leads.add(Lead);
            }
            insert Leads;
            
            Test.startTest();
            // Schedule the test job
            String jobId = System.schedule('ScheduledApexTest',
                CRON_EXP, 
                new DailyLeadProcessor());   
            Test.stopTest();
        set<id> ids = new set<id> ();
        for (lead l: Leads){
            ids.add(l.id);
        }
        system.debug('ids' +ids);
        List<Lead> leadsnew = [SELECT Id, LeadSource
                      FROM Lead
                      WHERE id IN: ids
                      //AND LeadSource = 'Dreamforce'
                      ];          
            system.debug('leadsnew ' +leadsnew);
            System.assertEquals('Dreamforce', leadsnew[0].LeadSource);
            // Stopping the test will run the job synchronously
           
            
        }
    }