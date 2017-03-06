package br.ufsm.ecommerce.email;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

public class Notificacao implements Runnable{

    private String destinatario;
    private String remetente;
    private String assunto;
    private String mensagem;

    public Notificacao(String destinatario, String assunto, String mensagem) {
        this.destinatario = destinatario;
        this.assunto = assunto;
        this.mensagem = mensagem;
        this.remetente = "solicitacaodedemandas@gmail.com";
    }

    public void sendEmail() throws EmailException {

        SimpleEmail email = new SimpleEmail();

        email.setHostName("smtp.gmail.com");
        email.setSmtpPort(465);
        email.setCharset("UTF-8");


        // Destinatário
        email.addTo(this.destinatario);
        // O email do qual enviará
        email.setFrom(this.remetente, "E-commerce");
        // Assunto
        email.setSubject(this.assunto);
        // Mensagem
        email.setMsg(this.mensagem);

        email.setSSL(true);
        // Autenticar Email
        email.setAuthentication("solicitacaodedemandas@gmail.com", "politecnicoufsm");

        email.send();
    }

    public void run() {
        try {
            sendEmail();
        } catch (EmailException e) {
            e.printStackTrace();
        }
    }

}
