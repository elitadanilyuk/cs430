import java.sql.*;

class Lab9_ex {
  public static void main(String args[]){

    Connection con = null;

    try {
      Statement stmt;
      ResultSet rs;

      // Register the JDBC driver for MySQL.
      Class.forName("com.mysql.cj.jdbc.Driver");

      // Define URL of database server for
      // database named 'user' on the faure.
      String url =
            "jdbc:mysql://faure/elita";

      // Get a connection to the database for a
      // user named 'user' with the password
      // 123456789.
      con = DriverManager.getConnection(
                        url,"elita", "832995269");

      // Display URL and connection information
      System.out.println("URL: " + url);
      System.out.println("Connection: " + con);

      // Get a Statement object
      stmt = con.createStatement();

	try{
      rs = stmt.executeQuery("SELECT * FROM author");
      while (rs.next()) {
        System.out.println (rs.getString("author_id"));
    }
    }catch(Exception e){
      System.out.print(e);
      System.out.println(
                "No Author table to query");
    }//end catch

    con.close();

  }catch( Exception e ) {
    e.printStackTrace();

  }//end catch

  }//end main

}//end class Lab4A_ex