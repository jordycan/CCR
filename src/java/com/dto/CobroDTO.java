/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dto;

import java.sql.Date;

/**
 * 
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class CobroDTO {
    
    private int id_venta;
    private int cod_cliente;
    private String nom_completo;
    private Date fecha;
    private String estado;
    private String mesPagado;
    private int cantidad;
    private int adeudo;
    private String empleado;

    public CobroDTO(int id_venta, int cod_cliente, String nom_completo, Date fecha, String estado, String mesPagado, int cantidad, int adeudo, String empleado) {
        this.id_venta = id_venta;
        this.cod_cliente = cod_cliente;
        this.nom_completo = nom_completo;
        this.fecha = fecha;
        this.estado = estado;
        this.mesPagado = mesPagado;
        this.cantidad = cantidad;
        this.adeudo = adeudo;
        this.empleado = empleado;
    }

  

    public CobroDTO(int id_venta, int cod_cliente, String nom_completo, Date fecha,String mesPagado, int adeudo) {
        this.id_venta = id_venta;
        this.cod_cliente = cod_cliente;
        this.nom_completo = nom_completo;
        this.fecha = fecha;
        this.mesPagado = mesPagado;
        this.adeudo = adeudo;
    }
    
    

    public int getId_venta() {
        return id_venta;
    }

    public void setId_venta(int id_venta) {
        this.id_venta = id_venta;
    }

    public int getCod_cliente() {
        return cod_cliente;
    }

    public void setCod_cliente(int cod_cliente) {
        this.cod_cliente = cod_cliente;
    }

    public String getNom_completo() {
        return nom_completo;
    }

    public void setNom_completo(String nom_completo) {
        this.nom_completo = nom_completo;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getAdeudo() {
        return adeudo;
    }

    public void setAdeudo(int adeudo) {
        this.adeudo = adeudo;
    }

    public String getEmpleado() {
        return empleado;
    }

    public void setEmpleado(String empleado) {
        this.empleado = empleado;
    }

    public String getMesPagado() {
        return mesPagado;
    }

    public void setMesPagado(String mesPagado) {
        this.mesPagado = mesPagado;
    }

    
    
    
    
}
