
package org.joshuasuy.view;

import java.util.List;
import java.util.Scanner;
import org.joshuasuy.model.Hotel;

public class HotelView {
    private final Scanner leer = new Scanner(System.in);
    
    public int mostrarMenu(){
        System.out.println("\n --- GESTION DE HOTELES ---");
        System.out.println("1. Registrar nuevo hotel");
        System.out.println("2. Listar todos los hoteles");
        System.out.println("3. Buscar un hotel por Ocupacion");
        System.out.println("4. Actualizar un hotel");
        System.out.println("5. Eliminar un hotel");
        System.out.println("6. Regresar al menu principal");
        System.out.println("Selecciones una opcion: ");
        return Integer.parseInt(leer.nextLine());        
    }
    
    public String solicitarOcupaciones(){
        System.out.println("Ingrese la ocupacion del hotel:");
        return leer.nextLine();
    }
    
    public String solicitarTipoHabitacion(){
        System.out.println("Ingrese el tipo de habitacion del hotel:");
        return leer.nextLine();
    }
    
    public String solicitarServicios(){
        System.out.println("Ingrese los servicios del hotel:");
        return leer.nextLine();
          
    }
    
    public String solicitarIdHotel(){
        System.out.println("Ingrese la Ocupacion del hotel");
        return leer.nextLine();
    }
    public void mostrarTodos(List<Hotel> hoteles){
        System.out.println("\n+++ LISTA DE HOTELES +++");
        
        for (Hotel h : hoteles){
            System.out.println(h.getOcupaciones()+ " | "+ h.getTipoDeHabitacion()+ " | " + h.getServicios() + "\n");
        }
    }
    
    public void mostrarHotel(Hotel hotel){
        System.out.println("\nDETALLE DE HOTEL");
        System.out.println("OCUPACION: " + hotel.getOcupaciones() );
        System.out.println("TIPO HABITACION: "+ hotel.getTipoDeHabitacion());
        System.out.println("SERVICIOS: "+ hotel.getServicios());
    }
    
    public void mostrarMensaje(String mensaje){
        System.out.println(mensaje);
    }
            
}
        
