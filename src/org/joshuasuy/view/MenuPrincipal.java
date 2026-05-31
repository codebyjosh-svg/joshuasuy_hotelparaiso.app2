
package org.joshuasuy.view;
import java.util.Scanner;
import org.joshuasuy.controller.HotelController;

public class MenuPrincipal {
    
    private final Scanner leer = new Scanner(System.in);
    
    public void iniciarSistema(){
        int opcion;
        
        do{
            System.out.println("------------------------------------------");
            System.out.println("   SISTEMA CENTRAL HOTEL PARAISO - IN4CM ");
            System.out.println("------------------------------------------");
            System.out.println("1. Entrar a HOTELES");
            System.out.println("2. Entrar a CLIENTES");
            System.out.println("3. Entrar a RESERVACIONES");
            System.out.println("4. SALISR DEL SISTEMA");
            System.out.println("Seleccione una opcion:");
            
            opcion =  Integer.parseInt(leer.nextLine());
            
            switch (opcion){
                case 1:
                    HotelView vista = new HotelView();
                    HotelController control = new HotelController(vissta);
                    control.iniciar();
                    break;
                case 2:
                    System.out.println("No existe la opcion aun");
                    break;
                case 3:
                    System.out.println("No existe la opcion aun");
                    break;
                case 4:
                    System.out.println("\n Hasta la próxima...");
                    break;
                default:
                    System.out.println("no existe la opcion");
                
            }
        }while (opcion != 4);
    }
}
