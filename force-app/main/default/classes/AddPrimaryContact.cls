public class AddPrimaryContact implements Queueable {

    private contact contact;
    private string stateAbb;
    

    public AddPrimaryContact(Contact cont, String sa){
    
        this.contact= cont;
        this.stateAbb= sa;

    }    
    
    public void execute(QueueableContext context) {
       
               
       List<Account> accounts = [Select id , Name, (Select id , firstname , lastname from contacts) From Account where BillingState =:stateAbb Limit 200];
       List<Contact> listContact = new List<Contact>();
       for(Account account: accounts){
           contact con = contact.clone(false,false,false,false);
           con.accountid = account.id;
           listContact.add(con);
       }
       insert listContact;
    }
            
}