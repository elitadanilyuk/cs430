package lab9;

import java.sql.*;

import lab9.exceptions.QueryException;

public class dbConnection {
    private Connection con;
    private final String CONNECTION = "jdbc:mysql://faure:3306/elita";
    private final String USR = "elita";
    private final String PWD = "832995269";
    private com.mysql.cj.jdbc.Driver Driver;

    public dbConnection(){
        this.init();
    }

    public ResultSet query(String query){
        Statement stmt;
        ResultSet result = null;
        try{
            stmt = con.createStatement();
            result = stmt.executeQuery(query);
        } catch (SQLException e) {
            System.out.printf("--xxx> FAILED Query %s", query);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    public void statement(String query){
        try{
            con.setAutoCommit(false);
            PreparedStatement stmt = con.prepareStatement(query);
            con.commit();
        } catch (SQLException e){
            System.out.printf("\n<xxx>Error executing statement %s\n", query);
        }
    }

    private void init(){

        try{
            con = DriverManager.getConnection(CONNECTION, USR, PWD);
            System.out.printf("Connected to: %s@%s", USR, CONNECTION);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public boolean foundValidSingleResult(String query) throws QueryException {
        ResultSet result = this.queryVerify(query);
        try {
            result.last();
            int last = result.getRow();
            return (last >= 0);
        } catch (SQLException e) {
            throw new QueryException();
        }
    }

    private ResultSet queryVerify(String query) {
        Statement stmt;
        ResultSet result = null;
        try{
            stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            result = stmt.executeQuery(query);
        } catch (SQLException e) {
            System.out.printf("Query %s failed", query);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }
}
