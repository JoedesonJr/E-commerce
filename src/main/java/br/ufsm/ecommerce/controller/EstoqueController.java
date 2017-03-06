package br.ufsm.ecommerce.controller;

import br.ufsm.ecommerce.dao.EstoqueDAO;
import br.ufsm.ecommerce.model.Estoque;
import br.ufsm.ecommerce.model.Mensagem;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;

@Controller
public class EstoqueController {

    @RequestMapping("/cadastro/estoque")
    public String cadastro() {
        return "principal/estoque/registrar-produto";
    }

    @RequestMapping("/visualizar/estoque")
    public String visualizar() { return "principal/estoque/modal-registrar-produto"; }

    @RequestMapping("getEstoque")
    public ResponseEntity<ArrayList<Estoque>> getEstoque() {
        return new ResponseEntity<ArrayList<Estoque>>(
            new EstoqueDAO().getEstoque(), HttpStatus.OK);
    }

    @RequestMapping("registrarProduto")
    public ResponseEntity<Mensagem> registrarProduto(@RequestBody Estoque estoque) throws Exception {

        if(new EstoqueDAO().registrarProduto(estoque)) {
            return new ResponseEntity<Mensagem>(
                 new Mensagem("OK", "Produto registrado com sucesso."), HttpStatus.OK);
        } else {
            return new ResponseEntity<Mensagem>(
                new Mensagem("ERRO", "Produto não registrado."), HttpStatus.OK);
        }
    }
}
