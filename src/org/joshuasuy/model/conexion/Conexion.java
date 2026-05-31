
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
     Connection conexion = null; // ✅ Nombre corregido: conexion
        
        try {
            // ✅ Carga el driver de MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            // ✅ Establece la conexión con los 3 datos
            conexion = DriverManager.getConnection(URL, USER, PASSWORD);
            // Opcional: System.out.println("Conectado correctamente");
            
        } catch (ClassNotFoundException e) {
            System.err.println("ERROR: No se encontró el driver de MySQL " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("ERROR: No se pudo conectar a la base de datos " + e.getMessage());
        }
        
        return conexion;
    }
}    