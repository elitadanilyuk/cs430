package lab9;

public class Util {

    public static String conformDate(String s){
        String sb[] = s.split("/");
        return String.format("%s-%s-%s", sb[2], sb[0], sb[1]);
    }
}
