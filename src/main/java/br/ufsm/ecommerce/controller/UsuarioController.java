package br.ufsm.ecommerce.controller;

import br.ufsm.ecommerce.dao.LoginDAO;
import br.ufsm.ecommerce.dao.UsuarioDAO;
import br.ufsm.ecommerce.email.Notificacao;
import br.ufsm.ecommerce.model.Mensagem;
import br.ufsm.ecommerce.model.Telefone;
import br.ufsm.ecommerce.model.Usuario;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.UUID;

@Controller
public class UsuarioController {

    // ROTAS
    @RequestMapping(value = "/cadastro/representante")
    public String cadastroRepresentante() { return "principal/representante/cadastrar-representante"; }

    @RequestMapping(value = "/visualizar/representantes")
    public String visualizarRepresentante() { return "principal/representante/visualizar-representates"; }

    @RequestMapping(value = "/cadastro/cliente")
    public String cadastroCliente() { return "principal/cliente/cadastrar-cliente"; }

    @RequestMapping(value = "/visualizar/clientes")
    public String visualizarCliente() { return "principal/cliente/visualizar-clientes"; }

    @RequestMapping("cadastrarUsuario")
    public ResponseEntity<Mensagem> cadastrarUsuario (@RequestBody Usuario usuario) throws SQLException {

        ArrayList<Telefone> telefones = usuario.getTelefone();
        for (int i=0; i<telefones.size(); i++) {
            if(telefones.get(i) == null) {
                telefones.remove(i);
            }
        }
        usuario.setTelefone(telefones);
        if(usuario.getIdFuncao() == 2) {
            usuario.setSenha((UUID.randomUUID().toString().
                toUpperCase()).substring(1, 8));
        } else {
            usuario.setSenha("-");
        }

        if(new UsuarioDAO().cadastrarUsuario(usuario)) {
            if(usuario.getIdFuncao() == 2) {
                new Thread(new Notificacao(
                    usuario.getEmail(), "Cadastro de Representante",
                    "Olá " +usuario.getNomeCompleto()+ ".\n\n" +"Você foi cadastrado como Representante no Sistema de E-commerce. \n\n"+
                    "Seu email de login é:  " +usuario.getEmail()+ "\nSua senha é:  " +usuario.getSenha()+ "\n\n"+
                    "OBS: Você poderá trocar essa senha no Sistema: http://200.132.36.170:8080/E-commerce/"
                )).start();

                return new ResponseEntity<Mensagem>(new Mensagem(
                    "OK", "Cadastro realizado. O Representante receberá um e-mail contendo um login e senha para acessa o sistema."),
                HttpStatus.OK);
            } else {
                return new ResponseEntity<Mensagem>(new Mensagem(
                    "OK", "Cadastro realizado."),
                HttpStatus.OK);
            }

        } else {
            return new ResponseEntity<Mensagem>(
                new Mensagem("ERRO", "Já existe um usuário com este E-mail e/ou CPF/CNPJ."), HttpStatus.OK);
        }
    }

    @RequestMapping("atualizarUsuario")
    public ResponseEntity<Mensagem> atualizarUsuario(@RequestBody Usuario usuario) throws SQLException {

        ArrayList<Telefone> telefones = usuario.getTelefone();
        for (int i=0; i<telefones.size(); i++) {
            if(telefones.get(i).getTelefone() == null ||
                telefones.get(i).getTelefone() == "") {
                telefones.remove(i);
            }
        }

        if(new UsuarioDAO().atualizarUsuario(usuario)) {
            return new ResponseEntity<Mensagem>(
                new Mensagem("OK", ""), HttpStatus.OK);
        } else {
            return new ResponseEntity<Mensagem>(
                new Mensagem("ERRO", ""), HttpStatus.OK);
        }
    }

    @RequestMapping("removerUsuario")
    public ResponseEntity<Mensagem> removerUsuario(@RequestBody Usuario usuario) throws Exception{

        if(new UsuarioDAO().removerUsuario(usuario.getIdUsuario())) {
            return new ResponseEntity<Mensagem>(
                new Mensagem("OK", ""), HttpStatus.OK);
        } else {
            return new ResponseEntity<Mensagem>(
                new Mensagem("ERRO", ""), HttpStatus.OK);
        }
    }

    @RequestMapping("alterarSenha")
    public ResponseEntity<Mensagem> alterarSenha(@RequestBody Usuario usuario, HttpSession session) throws SQLException{

        Mensagem mensagem;
        Usuario usuarioAutenticado = new LoginDAO().autenticarUsuario(usuario);

        if(usuarioAutenticado != null) {
            usuario.setIdUsuario(usuarioAutenticado.getIdUsuario());
            if(new UsuarioDAO().alterarSenha(usuario)) {
                session.invalidate();

                mensagem = new Mensagem("OK", "Senha alterada com sucesso.");
            } else {
                mensagem = new Mensagem("ERRO", "Senha não alterada, tente novamente.");
            }
        } else {
            mensagem = new Mensagem("ERRO", "Email e/ou senha invalido(s).");
        }

        return new ResponseEntity<Mensagem>(mensagem, HttpStatus.OK);
    }

    @RequestMapping("getUsuarios")
    public ResponseEntity<ArrayList<Usuario>> getUsuarios(int idFuncao) {
        return new ResponseEntity<ArrayList<Usuario>>(
            new UsuarioDAO().getUsuarios(idFuncao),HttpStatus.OK);
    }

}
