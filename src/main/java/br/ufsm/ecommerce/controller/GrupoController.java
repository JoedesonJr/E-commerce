package br.ufsm.ecommerce.controller;

import br.ufsm.ecommerce.dao.GrupoDAO;
import br.ufsm.ecommerce.model.Grupo;
import br.ufsm.ecommerce.model.Mensagem;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.SQLException;
import java.util.ArrayList;

@Controller
public class GrupoController {

    @RequestMapping(value = "/cadastro/grupo")
    public String cadastro() {
        return "principal/grupo/cadastrar-grupo";
    }

    @RequestMapping(value = "/visualizar/grupos")
    public String visualizar() { return "principal/grupo/visualizar-grupos"; }

    @RequestMapping("cadastrarGrupo")
    public ResponseEntity<Mensagem> cadastrarGrupo (@RequestBody Grupo grupo) throws SQLException {

        if(new GrupoDAO().cadastrarGrupo(grupo)) {
            return new ResponseEntity<Mensagem>(
                new Mensagem("OK", "Cadastro efetuado com sucesso."), HttpStatus.OK);
        } else {
            return new ResponseEntity<Mensagem>(
                new Mensagem("ERRO", "Grupo não cadastrado, tente novamente."), HttpStatus.OK);
        }
    }

    @RequestMapping("atualizarGrupo")
    public ResponseEntity<Mensagem> atualizarGrupo(@RequestBody Grupo grupo) throws SQLException {

        if(new GrupoDAO().atualizarGrupo(grupo)) {
            return new ResponseEntity<Mensagem>(
                new Mensagem("OK", "Grupo atualizado com sucesso."), HttpStatus.OK);
        } else {
            return new ResponseEntity<Mensagem>(
                new Mensagem("ERRO", "Grupo não atualizado, tente novamente."), HttpStatus.OK);
        }
    }

    @RequestMapping("removerGrupo")
    public ResponseEntity<Mensagem> removerGrupo(@RequestBody Grupo grupo) throws SQLException {

        if(new GrupoDAO().removerGrupo(grupo.getIdGrupo())) {
            return new ResponseEntity<Mensagem>(
                new Mensagem("OK", "Grupo removido com sucesso."), HttpStatus.OK);
        } else {
            return new ResponseEntity<Mensagem>(
                new Mensagem("ERRO", "Grupo não removido, tente novamente."), HttpStatus.OK);
        }
    }

    @RequestMapping("getGrupos")
    public ResponseEntity<ArrayList<Grupo>> getGrupos() {
        return new ResponseEntity<ArrayList<Grupo>>(new GrupoDAO().getGrupos(), HttpStatus.OK);
    }
}
