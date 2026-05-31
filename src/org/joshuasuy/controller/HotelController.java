
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
    this.dao = new HotelDAOImpl();
}

// Iniciamos con el menú
public void iniciar(){
    int opcion;
    do{
        opcion = vista.mostrarMenu();//Aca llama al menú de vista y guardamos la opciones
        switch (opcion){
            case 1:
                String ocup = vista.solicitarOcupaciones();
                String tipo = vista.solicitarTipoHabitacion();
                String serv = vista.solicitarServicios();
                Hotel nuevo = new Hotel(ocup, tipo, serv);
                boolean guardado = dao.insertar(nuevo);
                vista.mostrarMensaje(guardado ? "registro guardado" : "Erro al guardadar");
                break;
            case 2:
                    // Listar
                    List<Hotel> lista = dao.listar();
                    vista.mostrarTodos(lista);
                    break;
                case 3:
                    // Buscar
                    String idBuscar = vista.solicitarIdHotel();
                    Hotel buscado = dao.buscar(idBuscar);
                    if (buscado != null) {
                        vista.mostrarHotel(buscado);
                    } else {
                        vista.mostrarMensaje("No se encontro el hotel");
                    }
                    break;
                case 4:
                    // Actualizar
                    vista.mostrarMensaje("Funcion de actualizar en proceso");
                    break;
                case 5:
                    // Eliminar
                    String idEliminar = vista.solicitarIdHotel();
                    boolean eliminado = dao.eliminar(idEliminar);
                    vista.mostrarMensaje(eliminado ? "Eliminado correctamente" : "Error al eliminar");
                    break;
                case 6:
                    // Salir
                    vista.mostrarMensaje("Regresando...");
                    break;
                default:
                    vista.mostrarMensaje("no existe la opcion");
            }
        } while (opcion != 6);
    }
}