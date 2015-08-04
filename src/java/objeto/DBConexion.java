package objeto;
import java.sql.*;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.exceptions.MySQLDataException;
import java.sql.DriverManager;
import java.sql.SQLException;



public class DBConexion {
  public static Connection conexion() throws SQLException, ClassNotFoundException
    {
        Connection conexion;
        Class.forName("com.mysql.jdbc.Driver");
    
        String servidor="jdbc:mysql://localhost/dblestudiante";
        String usuario="root";
        String contrasenia="1234";
        conexion = (Connection)DriverManager.getConnection(servidor, usuario, contrasenia);
        return conexion;
    }
    
}
