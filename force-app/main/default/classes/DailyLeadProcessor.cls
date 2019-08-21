global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext ctx) {
        List<Lead> leads = [SELECT Id, LeadSource
                            FROM Lead
                            WHERE LeadSource = ''
                          LIMIT 200 ];
        List<Lead> updateleads = new  List<Lead>();
       for( lead l :leads){
           l.LeadSource = 'Dreamforce';
           updateleads.add(l);
       }     

       update updateleads ;
    }
    
}