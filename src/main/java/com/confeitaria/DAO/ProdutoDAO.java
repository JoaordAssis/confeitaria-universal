package com.confeitaria.DAO;

import com.confeitaria.config.Conexao;
import com.confeitaria.model.Produto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProdutoDAO {

    // Método para inserir um produto no banco de dados
	public void inserir(Produto produto) {
		String sql = "INSERT INTO produtos (nome, descricao, valor, status, img) VALUES (?, ?, ?, 1, ?)";
        try (Connection connection = Conexao.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setString(1, produto.getNome());
            stmt.setString(2, produto.getDescricao());
            stmt.setDouble(3, produto.getValor());
            stmt.setBytes(4, produto.getImagem());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    // Metodo para listar todos os produtos
	public List<Produto> listarTodos() {
	    List<Produto> produtos = new ArrayList<>();
	    String sql = "SELECT * FROM produtos";
	    try (Connection connection = Conexao.getConnection();
	         PreparedStatement stmt = connection.prepareStatement(sql);
	         ResultSet rs = stmt.executeQuery()) {

	        while (rs.next()) {
	            produtos.add(new Produto(
	                rs.getInt("id"),
	                rs.getString("nome"),
	                rs.getString("descricao"),
	                rs.getDouble("valor"),
	                rs.getInt("status"),
	                rs.getBytes("img")
	            ));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return produtos;
	}

    // Método para atualizar um produto
	 public void atualizar(Produto produto) {
	        String sql = "UPDATE produtos SET nome = ?, descricao = ?, valor = ?, img = ? WHERE id = ?";
	        try (Connection connection = Conexao.getConnection();
	             PreparedStatement stmt = connection.prepareStatement(sql)) {
	            stmt.setString(1, produto.getNome());
	            stmt.setString(2, produto.getDescricao());
	            stmt.setDouble(3, produto.getValor());
	            stmt.setBytes(4, produto.getImagem()); // Adiciona a imagem
	            stmt.setInt(5, produto.getId());
	            stmt.executeUpdate();
	            System.out.println("Produto atualizado com sucesso!");
	        } catch (SQLException e) {
	            System.err.println("Erro ao atualizar produto: " + e.getMessage());
	        }
	    }

    // Metodo para excluir um produto
    public void excluir(Produto produto) {
        String sql = "DELETE FROM produtos WHERE id = ?";
        try (Connection connection = Conexao.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, produto.getId());
            stmt.executeUpdate();
            System.out.println("Produto excluído com sucesso!");
        } catch (SQLException e) {
            System.err.println("Erro ao excluir produto: " + e.getMessage());
        }
    }


    public int getStatus(Produto produto) {
        String sql = "SELECT status FROM produtos WHERE id = ?";
        try (Connection connection = Conexao.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, produto.getId()); // Define o ID do produto na consulta
            ResultSet rs = stmt.executeQuery(); // Executa a consulta

            if (rs.next()) { // Verifica se há resultados
                int status = rs.getInt("status"); // Captura o valor da coluna "status"
                System.out.println("GetStatus Ok. Status: " + status);
                return status; // Retorna o status
            } else {
                System.out.println("Produto não encontrado.");
                return -1; // Retorna -1 se o produto não for encontrado
            }
        } catch (SQLException e) {
            System.err.println("Erro inesperado (getStatus): " + e.getMessage());
            return -1; // Retorna -1 em caso de erro
        }
    }

    public void alteraStatus(Produto produto) {
        int statusAtual = getStatus(produto); // Obtém o status atual do produto

        if (statusAtual == -1) {
            System.err.println("Erro: Produto não encontrado ou status inválido.");
            return;
        }

        int novoStatus = (statusAtual == 1) ? 0 : 1; // Alterna entre ativo (1) e inativo (0)
        String sql = "UPDATE produtos SET status = ? WHERE id = ?";

        try (Connection connection = Conexao.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, novoStatus); // Define o novo status
            stmt.setInt(2, produto.getId()); // Define o ID do produto
            stmt.executeUpdate(); // Executa a atualização
            System.out.println("Status alterado com sucesso! Novo status: " + novoStatus);
        } catch (SQLException e) {
            System.err.println("Erro ao alterar status: " + e.getMessage());
        }
    }
    
    
    public Produto buscarPorId(int id) {
        String sql = "SELECT * FROM produtos WHERE id = ?";
        Produto produto = null;

        try (Connection connection = Conexao.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setInt(1, id); // Define o ID do produto na consulta
            ResultSet rs = stmt.executeQuery(); // Executa a consulta

            if (rs.next()) { // Verifica se há resultados
                produto = new Produto(
                    rs.getInt("id"),
                    rs.getString("nome"),
                    rs.getString("descricao"),
                    rs.getDouble("valor"),
                    rs.getInt("status"),
                    rs.getBytes("img")
                );
                System.out.println("Produto encontrado: " + produto.getNome());
            } else {
                System.out.println("Produto não encontrado para o ID: " + id);
            }

        } catch (SQLException e) {
            System.err.println("Erro ao buscar produto por ID: " + e.getMessage());
        }

        return produto; // Retorna o produto encontrado ou null se não encontrado
    }
    
    
    
    public int contarProdutos() {
        String sql = "SELECT COUNT(*) AS total FROM produtos";
        try (Connection connection = Conexao.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    
    public int contarProdutosPorStatus(int status) {
        String sql = "SELECT COUNT(*) AS total FROM produtos WHERE status = ?";
        try (Connection connection = Conexao.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, status);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    public double calcularValorTotalEstoque() {
        String sql = "SELECT SUM(valor) AS total FROM produtos";
        try (Connection connection = Conexao.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getDouble("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0.0;
    }
}

