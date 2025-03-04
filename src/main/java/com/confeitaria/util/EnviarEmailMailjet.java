package com.confeitaria.util;
/*
import com.mailjet.client.ClientOptions;
import com.mailjet.client.MailjetClient;
import com.mailjet.client.MailjetRequest;
import com.mailjet.client.MailjetResponse;
import com.mailjet.client.errors.MailjetException;
import com.mailjet.client.errors.MailjetSocketTimeoutException;
import com.mailjet.client.resource.Emailv31;
import org.json.JSONArray;
import org.json.JSONObject;

public class EnviarEmailMailjet {

    public static void main(String[] args) {
        // Suas chaves de API do Mailjet
        String apiKey = "SUA_API_KEY";
        String apiSecret = "SUA_SECRET_KEY";

        // Configura o cliente Mailjet
        ClientOptions options = ClientOptions.builder()
                .apiKey(apiKey)
                .apiSecretKey(apiSecret)
                .build();

        MailjetClient client = new MailjetClient(options);

        // Cria o corpo do e-mail
        JSONObject email = new JSONObject();
        email.put(Emailv31.Message.FROM, new JSONObject()
                .put("Email", "seu_email@exemplo.com") // E-mail do remetente
                .put("Name", "Seu Nome")); // Nome do remetente

        email.put(Emailv31.Message.TO, new JSONArray()
                .put(new JSONObject()
                        .put("Email", "destinatario@exemplo.com") // E-mail do destinatário
                        .put("Name", "Nome do Destinatário"))); // Nome do destinatário

        email.put(Emailv31.Message.SUBJECT, "Assunto do E-mail"); // Assunto do e-mail
        email.put(Emailv31.Message.TEXTPART, "Olá, este é um e-mail de teste!"); // Corpo do e-mail em texto
        email.put(Emailv31.Message.HTMLPART, "<h1>Olá</h1><p>Este é um e-mail de teste!</p>"); // Corpo do e-mail em HTML

        // Cria a requisição
        MailjetRequest request = new MailjetRequest(Emailv31.resource)
                .property(Emailv31.MESSAGES, new JSONArray().put(email));

        try {
            // Envia o e-mail
            MailjetResponse response = client.post(request);

            // Exibe o resultado
            System.out.println("Status Code: " + response.getStatus());
            System.out.println("Resposta: " + response.getData());
        } catch (MailjetException | MailjetSocketTimeoutException e) {
            System.err.println("Erro ao enviar e-mail: " + e.getMessage());
        }
    }
}*/
