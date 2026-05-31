
package org.joshuasuy.model.dao;

import java.util.ArrayList;
import java.util.List;
import org.joshuasuy.model.Hotel;
import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class HotelDAOImpl implements HotelDAO {
    
    @Override
    public boolean insertar(Hotel hotel){
        return false;
    }
    
    @Override
    @SuppressWarnings("empty-statement")
    public List<Hotel>listar(){
        List<Hotel> hoteles = new ArrayList<>();
        String consulta ="{call sp_listarhotel()}";
        try (Connection conexion = conexion.conectar();
            CallableStatemen call = conexion.prepareCall(consulta);
            ResultSet resultado = call executeQuery()){
         while (resultado.next()){
             hoteles.add(new Hotel(
                     resultado.getString("ocupaciones"),
                     resultado.getString("tipo_de_habitacion"),
                     resultado.getString("servicios")
             ));
         }
        } catch (SQLException e){
                System.err.println("ERROR: al listar hotel: "+ e.get Message());
        }
        return hoteles;
        
    }
    
    @Override
    public Hotel buscar(String id){
        return null;
    }
    
    @Override
    public boolean actualizar(Hotel hotel){
        return false;
    }
    
    @Override
    public boolean eliminar (String id){
        return false;
    }
}
