global class LeadProcessor implements
    Database.Batchable<sObject>, Database.Stateful{
        
    // instance member to retain state across transactions
    global Integer recordsProcessed = 0;

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID, Name FROM Lead ');
    }

   global void execute(Database.BatchableContext bc, List<Lead> scope){
        // process each batch of records
        List<lead> leads = new List<lead>();
        for (Lead lead : scope) {
            lead.LeadSource = 'Dreamforce';
                // add contact to list to be updated
                leads.add(lead);
                // increment the instance member counter
                recordsProcessed = recordsProcessed + 1;
        }
       
        update leads;
    }    

    global void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed. Shazam!');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
        // call some utility to send email
       // EmailUtils.sendMessage(a, recordsProcessed);
       system.debug(job+ ' job');
    }    
     

}