package br.ufsm.ecommerce.controller;

import br.ufsm.ecommerce.dao.LoginDAO;
import br.ufsm.ecommerce.email.Notificacao;
import br.ufsm.ecommerce.model.Mensagem;
import br.ufsm.ecommerce.model.Usuario;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;


@Controller
public class LoginController {

    @RequestMapping("login")
    public String login() { return "login/login"; }

    @RequestMapping("logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:login";
    }

    @RequestMapping("buscarUsuario")
    public ResponseEntity<Usuario> buscarUsuario(@RequestBody Usuario usuario) {

        return new ResponseEntity<Usuario>(
            new LoginDAO().buscarUsuario(usuario), HttpStatus.OK);
    }

    @RequestMapping("autenticarUsuario")
    public String autenticarUsuario(Usuario usuario, HttpSession session, RedirectAttributes redirectAttributes) {

        Usuario usuarioAutenticado = new LoginDAO().autenticarUsuario(usuario);

        if(usuarioAutenticado != null) {
            session.setAttribute("usuarioLogado", usuarioAutenticado);

            return "redirect:principal";
        } else {
            redirectAttributes.addFlashAttribute("ERRO", new LoginDAO().buscarUsuario(usuario));

            return "redirect:login";
        }
    }

    @RequestMapping("recuperarSenha")
    public ResponseEntity<Mensagem> recuperarSenha(@RequestBody Usuario usuario) {

        ResponseEntity<Mensagem> response;
        usuario = new LoginDAO().recuperarSenha(usuario);

        if(usuario != null) {
            response = new ResponseEntity<Mensagem>(
                new Mensagem("OK", "Ok. A sua senha foi enviada para seu email."), HttpStatus.OK);

                new Thread(new Notificacao(
                    usuario.getEmail(), "Recuperar Senha",
                    "Olá " +usuario.getNomeCompleto()+ ".\n\n" +"Esta é sua senha: " +usuario.getSenha()+ "\n\n"+
                    "OBS: Você poderá trocar essa senha no Sistema: http://200.132.36.170:8080/E-commerce/"
                )).start();
        } else {
            response = new ResponseEntity<Mensagem>(
                new Mensagem("ERRO", "Este email não pertence a nenhuma conta."), HttpStatus.OK);
        }

        return response;
    }

    @RequestMapping("principal")
    public String teste() { return "principal/principal"; }
}
