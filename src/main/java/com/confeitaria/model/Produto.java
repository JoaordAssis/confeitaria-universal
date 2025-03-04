package com.confeitaria.model;

public class Produto {
    private int id;
    private String nome;
    private String descricao;
    private double valor;
    private int status;
    private byte[] imagem;

    // Construtor com 4 parâmetros (sem id e status)
    public Produto(String nome, double valor, String descricao, byte[] imagem) {
        this.nome = nome;
        this.descricao = descricao;
        this.valor = valor;
        this.imagem = imagem;
        this.status = 1; // Status padrão (1 para ativo)
    }

    // Construtor com todos os campos (opcional)
    public Produto(int id, String nome, String descricao, double valor, int status, byte[] imagem) {
        this.id = id;
        this.nome = nome;
        this.descricao = descricao;
        this.valor = valor;
        this.status = status;
        this.imagem = imagem;
    }

    public Produto() {
		// TODO Auto-generated constructor stub
	}

	// Getters e Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }

    public double getValor() { return valor; }
    public void setValor(double valor) { this.valor = valor; }

    public int getStatus() { return status; }
    public void setStatus(int status) { this.status = status; }

    public byte[] getImagem() { return imagem; }
    public void setImagem(byte[] imagem) { this.imagem = imagem; }
}