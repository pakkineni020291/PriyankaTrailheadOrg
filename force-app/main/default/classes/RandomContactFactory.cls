public class RandomContactFactory {
    
    public static list<contact> generateRandomContacts(integer numberofContacts, String lastname){
        list<contact> clist = new list<contact>();
        
        for(integer i=0;i<numberofContacts; i++){
            
            contact c = new contact(Firstname = 'TestContact' +i);
            clist.add(c);
            
        }
       return  clist;
    }

}