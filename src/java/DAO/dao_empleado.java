/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import com.modelo.ConexionMySQL;
import com.modelo.Conexionsql;
import java.sql.Connection;
import com.dto.EmpleadoDTO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author 
 */
public class dao_empleado {

    public dao_empleado(Connection conn) {
        this.conn = conn;
    }

    Connection conn;

    private static final String insertarEmpleado = "insert into empleados(nom_completo,telefono) values(?,?)";
    private static final String editarEmpleado = "update empleados set nom_completo=?,telefono=? where id_usuario=?";
    public boolean RegistrarEmpleado(String nombre, String telefono) throws SQLException {

        PreparedStatement pst = null;
        pst = conn.prepareStatement(insertarEmpleado);
        pst.setString(1, nombre);
        pst.setString(2, telefono);

        if (pst.executeUpdate() == 1) {
            return true;
        }

        return false;
    }
    public boolean EditarEmpleado(int id_usuario, String nom_completo, String telefono) throws SQLException {
       
        PreparedStatement pst = null;
        pst = conn.prepareStatement(editarEmpleado);
        pst.setString(1, nom_completo);
        pst.setString(2, telefono);
        pst.setInt(3, id_usuario);
        
        if (pst.executeUpdate() == 1) {
            return true;
        }

        return false;
    }

    public ArrayList<String> getClientes(String clientes) {
        ArrayList<String> list = new ArrayList<>();
        PreparedStatement ps = null;
        String data;
        try {
            ps = conn.prepareStatement("select * from clientes where nom_completo like ?");
            ps.setString(1, clientes + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                data = rs.getString("nom_completo");
                list.add(data);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    static Statement st = null;
    static ResultSet rs = null;

    public static List<EmpleadoDTO> MostrarEmpleado() {

        List<EmpleadoDTO> empleado = new ArrayList<EmpleadoDTO>();
        try {
            String query = "select id_usuario, nom_completo,telefono FROM empleados";
            Connection conexion = Conexionsql.Conexion();
            st = conexion.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {

                EmpleadoDTO detalles = new EmpleadoDTO(rs.getInt("id_usuario"), rs.getString("nom_completo"), rs.getString("telefono"));
                empleado.add(detalles);

            }

            return empleado;

        } catch (SQLException ex) {

        }

        return null;

    }
    
      public static List<EmpleadoDTO> MostrarIdEmp(String nombre) {

        List<EmpleadoDTO> empleado = new ArrayList<EmpleadoDTO>();
        try {
            String query = "select id_usuario, nom_completo,telefono FROM empleados where nom_completo='"+nombre+"'";
            Connection conexion = Conexionsql.Conexion();
            st = conexion.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {

                EmpleadoDTO detalles = new EmpleadoDTO(rs.getInt("id_usuario"), rs.getString("nom_completo"), rs.getString("telefono"));
                empleado.add(detalles);

            }

            return empleado;

        } catch (SQLException ex) {

        }

        return null;

    }
    

    
      public static List<EmpleadoDTO> MostrarEmpleadoPorCod(int cod) {

        List<EmpleadoDTO> empleado = new ArrayList<EmpleadoDTO>();
        try {
            String query = "select id_usuario, nom_completo,telefono FROM empleados where id_usuario="+cod;
            Connection conexion = Conexionsql.Conexion();
            st = conexion.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {

                EmpleadoDTO detalles = new EmpleadoDTO(rs.getInt("id_usuario"), rs.getString("nom_completo"), rs.getString("telefono"));
                empleado.add(detalles);

            }

            return empleado;

        } catch (SQLException ex) {

        }

        return null;

    }
    
      public boolean EliminarEmpleado(int id_empleado) throws SQLException{
		boolean respuesta = false;
		
                try{
                   String query="DELETE FROM empleados where id_usuario="+id_empleado+" ";
                   Connection conexion = Conexionsql.Conexion();
                   Statement st=null;
                   st=conexion.createStatement();
                   st.executeUpdate(query);
                   respuesta=true;
                   
                }catch(SQLException ex){
                    respuesta=false;
                }
		
		
		return respuesta;
	}

    public static void main(String args[]) {

        try {
            Connection conn;
            conn = ConexionMySQL.getConexionUnica("localhost", "conexiones_camino_real", "root", "root");

            dao_empleado sql = new dao_empleado(conn);
             List<EmpleadoDTO> detalles = sql.MostrarIdEmp("EmpladoPrueba");
      Calendar fecha = Calendar.getInstance();
       int mes = fecha.get(Calendar.MONTH) + 1;
  System.out.println(mes);


        
            //System.out.println(sql.RegistrarAlumnos("Endodoncia", 7, "A", 2017));

            //System.out.println(sql.RegistrarAlumnos(1, "Alumno 1", "Exodoncia", "6", "A",2010,"correo" ));
//           if(sql.EditarEmpleado(2,"Manuel","9348348")){
//                              
//			System.out.println("true");
//			}

        } catch (SQLException ex) {
			System.out.println(ex);
        }
    }   

}
