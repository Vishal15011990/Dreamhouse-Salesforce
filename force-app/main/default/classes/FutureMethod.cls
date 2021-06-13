public class FutureMethod {

public FutureMethod(){
    name();
    address();
    street();
    city();
}
    public static void name() {
        System.debug('Welcome To Future');
    }
    public static void address() {
        System.debug('Welcome To Serampore');
    }
    public static void street() {
        System.debug('Welcome To Phanindra');
    }
    public static void city() {
        System.debug('Welcome To Apartment');
    }
    FutureMethod ft=new FutureMethod();
}