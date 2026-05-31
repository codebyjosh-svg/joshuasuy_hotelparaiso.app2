package org.joshuasuy.model;

public class Hotel {
   
    private String ocupaciones;
    private String tipoDeHabitacion;
    private String servicios;
    
// Construimos los VACÍOS 
public Hotel(){
}

public Hotel(String ocupaciones, String tipoDeHabitacion, String servicios){
    this.ocupaciones = ocupaciones;
    this.tipoDeHabitacion = tipoDeHabitacion;
    this.servicios = servicios;
}

// creamos los Getters y Setters
public String getOcupaciones(){
    return ocupaciones;
}

public void setOcupaciones(String ocupaciones){
    this.ocupaciones = ocupaciones;
}

public String getTipoDeHabitacion(){
    return tipoDeHabitacion;
}

public void setTipoDeHabitacion(String tipoDeHabitacion){
    this.tipoDeHabitacion = tipoDeHabitacion;
}

public String getServicios(){
    return servicios;
}

public void setServicios(String servicios){
    this.servicios = servicios;
}
}
