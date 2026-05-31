
package org.joshuasuy.model.dao;

import java.util.List;
import org.joshuasuy.model.Hotel;

public interface HotelDAO {
    
    boolean insertar(Hotel hotel);
    List<Hotel> listar();
    Hotel buscar(String id);
    boolean actualizar(Hotel hotel);
    boolean eliminar(String id);
    
}
