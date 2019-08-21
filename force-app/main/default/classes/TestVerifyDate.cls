@isTest
public class TestVerifyDate {
    @isTest static void testCheckDates(){
    	Date myDate = Date.newInstance(2018, 12, 1);
		Date newDate = mydate.addDays(2);
    	Date dte = VerifyDate.CheckDates(myDate, newDate );
        //Date dte3 = VerifyDate.DateWithin30Days(myDate, newDate );
        Date newDate2 = mydate.addDays(35);
    	Date dte2 = VerifyDate.CheckDates(myDate, newDate2);
 	
    }    
}