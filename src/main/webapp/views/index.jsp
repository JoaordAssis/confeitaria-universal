<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confeitaria Universal</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* Reset e Estilos Globais */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            color: #333;
        }

        /* Navbar Estilizada */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1.5rem 5%;
            background: #fff;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }

        .logo img {
            height: 45px;
            width: auto;
        }

        .nav-links {
            display: flex;
            gap: 2rem;
            list-style: none;
        }

        .nav-links a {
            text-decoration: none;
            color: #444;
            font-weight: 500;
            transition: color 0.3s;
        }

        .nav-links a:hover {
            color: #E76F51;
        }

        /* Hero Section */
        .hero {
            margin-top: 80px;
            height: 70vh;
            background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)), 
                        url('https://images.unsplash.com/photo-1557925923-cd4648e211a0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80');
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
            padding: 0 5%;
        }

        .hero h1 {
            font-size: 3.5rem;
            margin-bottom: 1rem;
        }

        /* Seção de Produtos */
        .produtos {
            padding: 5rem 5%;
            background: #f9f9f9;
        }

        .grid-produtos {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .card-produto {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }

        .card-produto:hover {
            transform: translateY(-5px);
        }

        .card-imagem {
            height: 250px;
            background-size: cover;
            background-position: center;
        }

        .card-info {
            padding: 1.5rem;
            text-align: center;
        }

        .preco {
            color: #E76F51;
            font-size: 1.4rem;
            margin: 1rem 0;
            font-weight: 600;
        }

        .btn-comprar {
            background: #E76F51;
            color: white;
            padding: 0.8rem 2rem;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn-comprar:hover {
            background: #D45D40;
        }

        /* Formulário de Contato */
        .contato {
            padding: 5rem 5%;
            background: white;
        }

        .form-container {
            max-width: 600px;
            margin: 0 auto;
        }

        .form-input {
            width: 100%;
            padding: 1rem;
            margin-bottom: 1.5rem;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        /* Footer */
        footer {
            background: #2F3E46;
            color: white;
            padding: 3rem 5%;
            text-align: center;
        }

        /* Responsividade */
        @media (max-width: 768px) {
            .nav-links {
                display: none;
            }

            .hero h1 {
                font-size: 2.5rem;
            }

            .grid-produtos {
                grid-template-columns: 1fr;
            }
        }

        @media (min-width: 1200px) {
            .navbar {
                padding: 1.5rem 10%;
            }
            
            .hero {
                padding: 0 10%;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar">
        <div class="logo">
            <img src="logo.png" alt="Confeitaria Universal">
        </div>
        
        <ul class="nav-links">
            <li><a href="#">Produtos</a></li>
            <li><a href="#">Sobre</a></li>
            <li><a href="#">Contato</a></li>
            <li><a href="#">Blog</a></li>
        </ul>
    </nav>

    <!-- Hero Banner -->
    <section class="hero">
        <div>
            <h1>Confeitaria Artesanal Premium</h1>
            <p>Sabores exclusivos feitos com ingredientes selecionados</p>
        </div>
    </section>

    <!-- Produtos em Destaque -->
    <section class="produtos">
        <h2 style="text-align: center; font-size: 2.5rem; margin-bottom: 1rem;">Nossos Especiais</h2>
        
        <div class="grid-produtos">
            <div class="card-produto">
                <div class="card-imagem" style="background-image: url('bolo-premium.jpg');"></div>
                <div class="card-info">
                    <h3>Bolo Naked Cake</h3>
                    <p class="preco">R$ 120,00</p>
                    <button class="btn-comprar">Encomendar</button>
                </div>
            </div>
            
            <!-- Adicione mais cards de produtos aqui -->
        </div>
    </section>

    <!-- Formulário de Contato -->
    <section class="contato">
        <div class="form-container">
            <h2 style="text-align: center; margin-bottom: 2rem;">Fale Conosco</h2>
            <form>
                <input type="text" class="form-input" placeholder="Seu nome">
                <input type="email" class="form-input" placeholder="Seu e-mail">
                <textarea class="form-input" rows="5" placeholder="Sua mensagem"></textarea>
                <button type="submit" class="btn-comprar" style="width: 100%;">Enviar Mensagem</button>
            </form>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div style="margin-bottom: 2rem;">
            <img src="logo-branco.png" alt="Logo" style="height: 60px; margin-bottom: 1rem;">
            <div style="display: flex; justify-content: center; gap: 2rem; margin: 1rem 0;">
                <a href="#" style="color: white;"><i class="fab fa-instagram"></i></a>
                <a href="#" style="color: white;"><i class="fab fa-facebook"></i></a>
                <a href="#" style="color: white;"><i class="fab fa-whatsapp"></i></a>
            </div>
        </div>
        <p>&copy; 2023 Confeitaria Universal. Todos os direitos reservados.</p>
    </footer>
</body>
</html>