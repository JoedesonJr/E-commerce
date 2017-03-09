package br.ufsm.ecommerce.controller;

import br.ufsm.ecommerce.dao.VendaDAO;
import br.ufsm.ecommerce.model.Cartao;
import br.ufsm.ecommerce.model.Mensagem;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.SQLException;
import java.util.ArrayList;

@Controller
public class VendaController {

    @RequestMapping(value = "/visualizar/vendas")
    public String visualizar() {
        return "principal/venda/vendas";
    }

    @RequestMapping(value = "/cadastro/venda")
    public String cadastro() { return "principal/venda/realizar-venda"; }

    @RequestMapping(value = "/cadastro/cartao")
    public String cadastroCartao() { return "principal/venda/cartoes-credito"; }

    @RequestMapping("getCartao")
    public ResponseEntity<ArrayList<Cartao>> getCartao() throws SQLException {
        return new ResponseEntity<ArrayList<Cartao>>(new VendaDAO().getCartao(), HttpStatus.OK);
    }

    @RequestMapping("cadastrarCartoes")
    public ResponseEntity<Mensagem> cadastrarCartoes(@RequestBody ArrayList<Cartao> cartoes) throws SQLException {

        if(new VendaDAO().cadastrarCartoes(cartoes)) {
            return new ResponseEntity<Mensagem>(
                new Mensagem("OK", "Cartões atualizados com sucesso."),
            HttpStatus.OK);
        } else {
            return new ResponseEntity<Mensagem>(
                new Mensagem("ERRO", "Opa, cartões não atualizados. Tente novamente."),
            HttpStatus.OK);
        }
    }

}
