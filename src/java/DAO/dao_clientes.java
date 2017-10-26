/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import com.dto.ClientesDTO;
import com.dto.EmpleadoDTO;
import com.dto.TipoClientesDTO;
import com.modelo.ConexionMySQL;
import com.modelo.Conexionsql;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Jordy Can
 */
public class dao_clientes {

    public dao_clientes(Connection conn) {
        this.conn = conn;
    }

    Connection conn;

    private static final String insertarClientes = "insert into Clientes(nom_completo,direccion,sector,id_tipo,telefono) values(?,?,?,?,?)";
    private static final String editarCliente = "update clientes set nom_completo=?,direccion=?,sector=?,id_tipo=?,telefono=? where cod_cliente=?";

    public boolean RegistrarClientes(String nombre, String direccion, String sector,int id_tipo, String telefono) throws SQLException {

        PreparedStatement pst = null;
        pst = conn.prepareStatement(insertarClientes);
        pst.setString(1, nombre);
        pst.setString(2, direccion);
        pst.setString(3, sector);
        pst.setInt(4, id_tipo);
        pst.setString(5, telefono);

        if (pst.executeUpdate() == 1) {
            return true;
        }

        return false;
    }

    public boolean EditarCliente(int cod_cliente, String nom_completo, String direccion, String sector,int id_tipo, String telefono) throws SQLException {

        PreparedStatement pst = null;
        pst = conn.prepareStatement(editarCliente);
        pst.setString(1, nom_completo);
        pst.setString(2, direccion);
        pst.setString(3, sector);
        pst.setInt(4, id_tipo);
        pst.setString(5, telefono);
        pst.setInt(6, cod_cliente);

        if (pst.executeUpdate() == 1) {
            return true;
        }

        return false;
    }

    static Statement st = null;
    static ResultSet rs = null;

    public static List<ClientesDTO> MostrarClientes() {

        List<ClientesDTO> clientes = new ArrayList<ClientesDTO>();
        try {
            String query = "select cod_cliente, nom_completo,direccion,sector,id_tipo,telefono FROM clientes";
            Connection conexion = Conexionsql.Conexion();
            st = conexion.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {

                ClientesDTO detalles = new ClientesDTO(rs.getInt("cod_cliente"), rs.getString("nom_completo"), rs.getString("direccion"), rs.getString("sector"), rs.getString("telefono"), rs.getInt("id_tipo"));
                clientes.add(detalles);

            }

            return clientes;

        } catch (SQLException ex) {

        }

        return null;

    }

    public static String MostrarTipoDeCliente(int id_tipo) {

        String tipo_cliente="";
        try {
            String query = "select tipo_cliente FROM tipo_clientes where id_tipo=" + id_tipo;
            Connection conexion = Conexionsql.Conexion();
            st = conexion.createStatement();
            rs = st.executeQuery(query);

            while (rs.next()) {

                tipo_cliente=rs.getString("tipo_cliente");
            }

            return tipo_cliente;

        } catch (SQLException ex) {

        }

        return null;

    }
    
       public static int MostrarIdClienteporNombre(String nombre) {

        int tipo_cliente=0;
        try {
            String query = "select cod_cliente FROM clientes where nom_completo='"+nombre+"'";
            Connection conexion = Conexionsql.Conexion();
            st = conexion.createStatement();
            rs = st.executeQuery(query);

            while (rs.next()) {

                tipo_cliente=rs.getInt("cod_cliente");
            }

            return tipo_cliente;

        } catch (SQLException ex) {

        }

        return 0;

    }
    
    public static int MostrarTipoPorNombre(String nombre) {

        int tipo_cliente=0;
        try {
            String query = "select id_tipo FROM clientes where nom_completo='"+nombre+"'";
            Connection conexion = Conexionsql.Conexion();
            st = conexion.createStatement();
            rs = st.executeQuery(query);

            while (rs.next()) {

                tipo_cliente=rs.getInt("id_tipo");
            }

            return tipo_cliente;

        } catch (SQLException ex) {

        }

        return 0;

    }

    public boolean EliminarCliente(int id_empleado) throws SQLException {
        boolean respuesta = false;

        try {
            String query = "DELETE FROM clientes where cod_cliente=" + id_empleado + " ";
            Connection conexion = Conexionsql.Conexion();
            Statement st = null;
            st = conexion.createStatement();
            st.executeUpdate(query);
            respuesta = true;

        } catch (SQLException ex) {
            respuesta = false;
        }

        return respuesta;
    }

    public static List<ClientesDTO> MostrarClientePorCod(int cod) {

        List<ClientesDTO> cliente = new ArrayList<ClientesDTO>();
        try {
            String query = "select cod_cliente, nom_completo, direccion, sector, telefono FROM clientes where cod_cliente=" + cod;
            Connection conexion = Conexionsql.Conexion();
            st = conexion.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {

                ClientesDTO detalles = new ClientesDTO(rs.getInt("cod_cliente"), rs.getString("nom_completo"), rs.getString("direccion"), rs.getString("sector"), rs.getString("telefono"));
                cliente.add(detalles);

            }

            return cliente;

        } catch (SQLException ex) {

        }

        return null;

    }

    public static List<ClientesDTO> MostrarClientePorNombre(String nombre) {

        List<ClientesDTO> cliente = new ArrayList<ClientesDTO>();
        try {
            String query = "select cod_cliente FROM clientes where nom_completo='" + nombre + "'";
            Connection conexion = Conexionsql.Conexion();
            st = conexion.createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {

                ClientesDTO detalles = new ClientesDTO(rs.getInt("cod_cliente"));
                cliente.add(detalles);

            }

            return cliente;

        } catch (SQLException ex) {

        }

        return null;

    }

    public static void main(String args[]) {

        Connection conn;

        try {
            conn = ConexionMySQL.getConexionUnica("localhost", "Conexiones_Camino_Real", "root", "root");

            dao_clientes dao = new dao_clientes(conn);
            //List<TipoClientesDTO> detalles = dao_clientes.MostrarTipoDeCliente(1);
           int cc=dao_clientes.MostrarIdClienteporNombre("SONIA CHI UC");
           System.out.println(cc);
            // System.out.println(detalles.get(0).getTipo_cliente());
            //System.out.println(("Empleado1", "Colonia Nueva", "Pomuch", "981139962"));

            //System.out.println(sql.RegistrarAlumnos(1, "Alumno 1", "Exodoncia", "6", "A",2010,"correo" ));
        } catch (SQLException ex) {
            Logger.getLogger(dao_usuarios.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
