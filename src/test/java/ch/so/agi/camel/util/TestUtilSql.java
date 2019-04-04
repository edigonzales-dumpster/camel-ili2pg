package ch.so.agi.camel.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.testcontainers.containers.PostgreSQLContainer;

public class TestUtilSql {
    public static Connection connectPG(PostgreSQLContainer postgres) {
        Connection con = null;
        try {
            String url = postgres.getJdbcUrl();
            String user = postgres.getUsername();
            String password = postgres.getPassword();

            con = DriverManager.getConnection(url, user, password);

            con.setAutoCommit(false);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return con;
    }
    
    public static void closeCon(Connection con) {
        try {
            if (con != null)
                con.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
