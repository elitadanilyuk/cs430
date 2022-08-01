package lab9.exceptions;

public class QueryException extends Exception{

    public QueryException(){

    }

    public void printError(String s){
        System.out.printf("ERROR %s", s);
    }

}
