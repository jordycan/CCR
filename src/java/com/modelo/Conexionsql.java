/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Jordy Can
 */
public class Conexionsql {

    static String url = "jdbc:mysql://localhost:3306/conexiones_camino_real";
    static String usuario = "root";
    static String contraseña = "root";

    public static Connection Conexion() throws SQLException {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection(url, usuario, contraseña);

            return conexion;

        } catch (ClassNotFoundException es) {
            return null;
        }
    }
}
