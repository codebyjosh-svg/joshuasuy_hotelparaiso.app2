
package org.joshuasuy.controller;

//Importamos las clases,
import org.joshuasuy.model.dao.HotelDAO;
import org.joshuasuy.model.dao.HotelDAOImpl;
import org.joshuasuy.model.Hotel;
import org.joshuasuy.view.HotelView;
import java.util.List;

public class HotelController {
    //Colocamos nuestros atributso
    private final HotelView vista;
    private final HotelDAO dao;
    
//Recibe la vista
public HotelController(HotelView vista){
    this.vista = vista;
    tis.dao = new HotelDAOImpl();
}

}