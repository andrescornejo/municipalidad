using Muni.Properties;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Muni.Classes
{
    public static class God
    {
        public static string CONNECTIONSTRING = Properties.Resources.CONNECTIONSTRING;

        public static SqlConnection getConnection()
        {
            return new SqlConnection(CONNECTIONSTRING);
        }

        //Metodo para el login
        public static int login(string username, string password)
        {
            //Pido conexion
            SqlConnection connection = getConnection();

            //Preparar el comando
            SqlCommand command = new SqlCommand("spLogin", connection);

            //Especificar que es un sp
            command.CommandType = CommandType.StoredProcedure;

            //Agregar los parametros
            command.Parameters.Add(new SqlParameter("@usernameInput", username));
            command.Parameters.Add(new SqlParameter("@passwordInput",password));

            var returnValue = command.Parameters.Add("@ReturnVal",SqlDbType.Int);
            returnValue.Direction = ParameterDirection.ReturnValue;

            //Abro la conexion
            connection.Open();
            //Ejecuto el comando
            command.ExecuteNonQuery();
            //Cierro la conexion
            connection.Close();

            return (int) returnValue.Value;
        }

        public static DataTable getPropietarios()
        {
            //Pido conexion
            SqlConnection connection = getConnection();

            //Variable que guarda la tabla resultante del sp
            DataTable datatable = new DataTable();

            //Preparo el SqlDataAdapter
            SqlDataAdapter sqlda = new SqlDataAdapter("csp_getPropietarios", connection);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;

            //Abro la conexion
            connection.Open();

            //Ejecuto y guardo la tabla en la variable
            sqlda.Fill(datatable);

            //Cierro la conexion
            connection.Close();

            return datatable;
        }

        public static DataTable getPropiedadesDePropietario(string id)
        {
            //Pido conexion
            SqlConnection connection = getConnection();

            //Variable que guarda la tabla resultante del sp
            DataTable datatable = new DataTable();

            //Preparo el SqlDataAdapter
            SqlDataAdapter sqlda = new SqlDataAdapter("csp_getPropiedadesDePropietario", connection);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;

            //Agregar los parametros
            sqlda.SelectCommand.Parameters.AddWithValue("@idInput", id);

            //Abro la conexion
            connection.Open();

            //Ejecuto y guardo la tabla en la variable
            sqlda.Fill(datatable);

            //Cierro la conexion
            connection.Close();

            return datatable;
        }

        public static DataTable getPropiedades()
        {
            //Pido conexion
            SqlConnection connection = getConnection();

            //Variable que guarda la tabla resultante del sp
            DataTable datatable = new DataTable();

            //Preparo el SqlDataAdapter
            SqlDataAdapter sqlda = new SqlDataAdapter("csp_getPropiedades", connection);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;

            //Abro la conexion
            connection.Open();

            //Ejecuto y guardo la tabla en la variable
            sqlda.Fill(datatable);

            //Cierro la conexion
            connection.Close();

            return datatable;
        }

        public static DataTable getPropiedadesFromPropietarioDocID(string id)
        {
            //Pido conexion
            SqlConnection connection = getConnection();

            //Variable que guarda la tabla resultante del sp
            DataTable datatable = new DataTable();

            //Preparo el SqlDataAdapter
            SqlDataAdapter sqlda = new SqlDataAdapter("csp_getPropiedadesFromPropietarioDocID", connection);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;

            //Agregar los parametros
            sqlda.SelectCommand.Parameters.AddWithValue("@inputDocID", id);

            //Abro la conexion
            connection.Open();

            //Ejecuto y guardo la tabla en la variable
            sqlda.Fill(datatable);

            //Cierro la conexion
            connection.Close();

            return datatable;
        }

        public static DataTable getPropietariosFromNumFinca(string numFinca)
        {
            //Pido conexion
            SqlConnection connection = getConnection();

            //Variable que guarda la tabla resultante del sp
            DataTable datatable = new DataTable();

            //Preparo el SqlDataAdapter
            SqlDataAdapter sqlda = new SqlDataAdapter("csp_getPropietariosFromNumFinca", connection);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;

            //Agregar los parametros
            sqlda.SelectCommand.Parameters.AddWithValue("@inputNumFinca", numFinca);

            //Abro la conexion
            connection.Open();

            //Ejecuto y guardo la tabla en la variable
            sqlda.Fill(datatable);

            //Cierro la conexion
            connection.Close();

            return datatable;
        }

        public static DataTable getUsuarioFromNumFinca(string numFinca)
        {
            //Pido conexion
            SqlConnection connection = getConnection();

            //Variable que guarda la tabla resultante del sp
            DataTable datatable = new DataTable();

            //Preparo el SqlDataAdapter
            SqlDataAdapter sqlda = new SqlDataAdapter("csp_getUsuarioFromNumFinca", connection);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;

            //Agregar los parametros
            sqlda.SelectCommand.Parameters.AddWithValue("@inputNumFinca", numFinca);

            //Abro la conexion
            connection.Open();

            //Ejecuto y guardo la tabla en la variable
            sqlda.Fill(datatable);

            //Cierro la conexion
            connection.Close();

            return datatable;
        }

        public static DataTable getUsuariosDeLaPropiedad(string id)
        {
            //Pido conexion
            SqlConnection connection = getConnection();

            //Variable que guarda la tabla resultante del sp
            DataTable datatable = new DataTable();

            //Preparo el SqlDataAdapter
            SqlDataAdapter sqlda = new SqlDataAdapter("csp_getPropiedadesDeUsuario", connection);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;

            //Agregar los parametros
            sqlda.SelectCommand.Parameters.AddWithValue("@usernameInput", id);

            //Abro la conexion
            connection.Open();

            //Ejecuto y guardo la tabla en la variable
            sqlda.Fill(datatable);

            //Cierro la conexion
            connection.Close();

            return datatable;
        }

        public static DataTable getUsernames()
        {
            //Pido conexion
            SqlConnection connection = getConnection();

            //Variable que guarda la tabla resultante del sp
            DataTable datatable = new DataTable();

            //Preparo el SqlDataAdapter
            SqlDataAdapter sqlda = new SqlDataAdapter("csp_getUsernames", connection);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;

            //Abro la conexion
            connection.Open();

            //Ejecuto y guardo la tabla en la variable
            sqlda.Fill(datatable);

            //Cierro la conexion
            connection.Close();

            return datatable;
        }

        public static void addUser(string user, string pass, bool isadmin)
        {
            //Pido conexion
            SqlConnection connection = getConnection();

            //Variable que guarda la tabla resultante del sp
            DataTable datatable = new DataTable();

            //Preparo el SqlDataAdapter
            SqlCommand cmd = new SqlCommand("csp_adminAddUser", connection);
            cmd.CommandType = CommandType.StoredProcedure;

            //Agregar los parametros
            cmd.Parameters.AddWithValue("@inputUsername", user);
            cmd.Parameters.AddWithValue("@inputPasswd", pass);
            cmd.Parameters.AddWithValue("@inputBit", isadmin);

            //Abro la conexion
            connection.Open();

            //Ejecuto el SP
            int rowAffected = cmd.ExecuteNonQuery();
       
            //Cierro la conexion
            connection.Close();
        }

    }
}