@isTest
public class TestRestrictContactByName {
   @isTest static void testInvalidLastName(){
       try{
    contact c = new contact(lastname = 'VALIDNAME');
    insert c;
    contact c1 = new  contact();
           c1 = [select id from contact where id = :c.id];
           c1.lastname = 'INVALIDNAME';
           update c1;
       }catch(DMLException e){
           system.debug('invalid data');
       }
   }
}