@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());

        string result = 'India';
        // Verify that a fake result is returned
        System.assertEquals(new List<String>{'hyd','sec','uppal'}, ParkLocator.country(result));
    }
}