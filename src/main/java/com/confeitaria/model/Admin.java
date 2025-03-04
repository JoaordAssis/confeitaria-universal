package com.confeitaria.model;

public class Admin {
    private int id;
    private String nome;
    private String email;
    private String cargo;
    private String senha;
    private int status;

    // Construtor para inserção sem ID
    public Admin(String nome, String email, String cargo, String senha, int status) {
        this.nome = nome;
        this.email = email;
        this.cargo = cargo;
        this.senha = senha;
        this.status = status;
    }

    // Construtor para listar com ID
    public Admin(int id, String nome, String email, String cargo, String senha, int status) {
        this.id = id;
        this.nome = nome;
        this.email = email;
        this.cargo = cargo;
        this.senha = senha;
        this.status = status;
    }
    
    
    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
}
