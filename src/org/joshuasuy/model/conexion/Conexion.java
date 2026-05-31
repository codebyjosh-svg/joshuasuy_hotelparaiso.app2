
package org.joshuasuy.model.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    
    private static final String URL =
            "jdbc:mysql://localhost:3306/hotelparaisodb_in4cm?serverTimezon=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "suy.24";
    
    public static Connection conectar(){
        connection conexion = null;
        
        try{
            class.forName("com.mysql.cj.jdbc.Driver");
            
            conexion = DriverManager.getConnection(URL, USER, PASSWORD);
            
        }catch (ClassNotFounException e){
            System.err.print("ERROR:nohay driver.");
            
        }catch (SQLException ex){
            System.err.print("ERROR: no se pudo conectar a la DB"+ ex.getMessage());
        }
        
        return conexion;
    }
}
