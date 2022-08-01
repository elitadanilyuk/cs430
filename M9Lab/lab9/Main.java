package lab9;

public class Main {
    public static void main(String args[]){
        boolean verbose = false;

        System.out.println("\n\n***   Lab9   ***\n\n");
        if(args.length >= 2){
            if (args[1].equalsIgnoreCase("V")){
                verbose = true;
            }
        }

        dbConnection db = new dbConnection();
        App App = new App(db, args, verbose);

        System.out.println("\n\n*** End of Program ***\n\n");
    }
}
