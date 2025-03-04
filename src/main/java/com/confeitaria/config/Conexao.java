package com.confeitaria.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
    private static final String URL = "jdbc:mysql://localhost:3306/confeitaria";
    private static final String USER = "root";
    private static final String PASSWORD = "@112542Tt";

    public static Connection getConnection() {
        try {
            System.out.println("Tentando conectar ao banco de dados...");
            // Carrega o driver JDBC do MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Cria a conexão
            Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Conexão com o banco de dados estabelecida!");
            return connection;
        } catch (ClassNotFoundException e) {
            System.err.println("Driver JDBC do MySQL não encontrado!");
            throw new RuntimeException("Driver JDBC do MySQL não encontrado!", e);
        } catch (SQLException e) {
            System.err.println("Erro ao conectar ao banco de dados: " + e.getMessage());
            throw new RuntimeException("Erro ao conectar ao banco de dados", e);
        }
    }
}