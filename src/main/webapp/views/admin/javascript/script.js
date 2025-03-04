// Função para alternar o menu lateral em dispositivos móveis
const menuToggle = document.getElementById('menu-toggle');
const sidebar = document.getElementById('sidebar');

menuToggle.addEventListener('click', () => {
    sidebar.classList.toggle('active');
});

// Exemplo de interatividade: Alterar o nome do usuário dinamicamente
const usernameElement = document.getElementById('username');
const username = "João Silva"; // Substitua pelo nome do usuário logado
usernameElement.textContent = username;