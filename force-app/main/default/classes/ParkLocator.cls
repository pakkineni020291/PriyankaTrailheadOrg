public class ParkLocator{
    public static string[] country(string country) {
        ParkService.ParksImplPort PS =  new ParkService.ParksImplPort();
        return PS.byCountry(country);
    }
}