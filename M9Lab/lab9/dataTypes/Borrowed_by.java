package lab9.dataTypes;

import java.util.Date;

public class Borrowed_by extends absData {
    public int memberID;
    public String isbn;
    public String library;
    public String checkout_date;
    public String checkin_date;

    public Borrowed_by(){

    }

    @Override
    public String toString(){
       return String.format("MemberID: %d\nISBN: %s\nLibrary: %s\nCheckoutDate: %s\nCheckinDate: %s",
                memberID, isbn, library, checkout_date, checkin_date);
    }
}
