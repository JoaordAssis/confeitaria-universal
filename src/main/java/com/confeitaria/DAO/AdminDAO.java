package com.confeitaria.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.nio.charset.StandardCharsets;
import java.math.BigInteger;

import com.confeitaria.config.Conexao;
import com.confeitaria.model.Admin;
import com.confeitaria.model.Produto;

public class AdminDAO {
	
	//API KEY 21d9eecde5dcc8dbb247d0c6ac5b78c0
	// SECRET KEY 99eac3d45b5d652ecb12dd233ee0b94c
	
	
	public static String criptografarSenha(String senha) {
        try {
            // Cria uma instância do MessageDigest para SHA-256
            MessageDigest digest = MessageDigest.getInstance("SHA-256");

            // Converte a senha em um array de bytes
            byte[] hashBytes = digest.digest(senha.getBytes(StandardCharsets.UTF_8));

            // Converte o array de bytes em uma representação hexadecimal
            BigInteger bigInt = new BigInteger(1, hashBytes);
            String hashHex = bigInt.toString(16);

            // Completa com zeros à esquerda, se necessário
            while (hashHex.length() < 64) {
                hashHex = "0" + hashHex;
            }

            return hashHex;
        } catch (NoSuchAlgorithmException e) {
            // SHA-256 deve estar disponível, mas trata a exceção por segurança
            throw new RuntimeException("Erro ao criptografar a senha: " + e.getMessage());
        }
    }
	
	public void insereAdmin(Admin admin) {
	    String sql = "INSERT INTO user_admin (nome, email, cargo, senha, status) VALUES (?, ?, ?, ?, ?)";
	    try (Connection connection = Conexao.getConnection();
	         PreparedStatement stmt = connection.prepareStatement(sql)) {
	        
	        stmt.setString(1, admin.getNome());
	        stmt.setString(2, admin.getEmail());
	        stmt.setString(3, admin.getCargo());
	        stmt.setString(4, admin.getSenha());
	        stmt.setInt(5, admin.getStatus());
	        
	        int rowsAffected = stmt.executeUpdate();
	        System.out.println("Linhas afetadas: " + rowsAffected); // Log para depuração
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	
	public boolean verificaAdmin(Admin admin) {
	    String sql = "SELECT * FROM user_admin WHERE email = ?";
	    
	    try (Connection connection = Conexao.getConnection();
	         PreparedStatement stmt = connection.prepareStatement(sql)) {
	        
	        stmt.setString(1, admin.getEmail());
	        ResultSet rs = stmt.executeQuery();

	        if (rs.next()) { // Verifica se há resultados
	            System.out.println("Email Localizado");
	            return true; // Retorna true se o email já existe
	        } else {
	            System.out.println("Email nao localizado, seguindo com cadastro.");
	            return false; // Retorna false se o email não existe
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    System.out.println("Erro.");
	    return false;
	}
	
	public List<Admin> listarTodos() {
	    List<Admin> admins = new ArrayList<>();
	    String sql = "SELECT * FROM user_admin";
	    try (Connection connection = Conexao.getConnection();
	         PreparedStatement stmt = connection.prepareStatement(sql);
	         ResultSet rs = stmt.executeQuery()) {

	        while (rs.next()) {
	            admins.add(new Admin(
	                rs.getInt("id"),
	                rs.getString("nome"),
	                rs.getString("email"),
	                rs.getString("cargo"),
	                rs.getString("senha"),
	                rs.getInt("status")
	                ));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return admins;
	}
	
	public Admin buscarPorEmail(String email) {
	    String sql = "SELECT * FROM user_admin WHERE email = ?";
	    Admin admin = null;

	    try (Connection connection = Conexao.getConnection();
	         PreparedStatement stmt = connection.prepareStatement(sql)) {
	        stmt.setString(1, email);
	        ResultSet rs = stmt.executeQuery();

	        if (rs.next()) {
	            admin = new Admin(
	                rs.getInt("id"),
	                rs.getString("nome"),
	                rs.getString("email"),
	                rs.getString("cargo"),
	                rs.getString("senha"),
	                rs.getInt("status")
	            );
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return admin;
	}
	
}
	
