document.querySelectorAll('.btn-inativar').forEach(button => {
    button.addEventListener('click', (event) => {
        if (!confirm('Tem certeza que deseja inativar este produto?')) {
            event.preventDefault(); // Cancela a ação se o usuário não confirmar
        }
    });
});


function confirmarExclusao(nomeProduto) {
        const mensagem = `⚠️ Tem certeza que deseja excluir o produto "${nomeProduto}"?\n\n` +
                         `Ao excluir um produto, o mesmo, caso volte ao catálogo, deverá ser recadastrado.\n` +
                         `Utilize a função "Inativar" para que o produto pare de ser exibido no catálogo.`;
        return confirm(mensagem);
    };