package br.ufsm.ecommerce.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class VendaController {

    @RequestMapping(value = "/visualizar/vendas")
    public String visualizar() {
        return "principal/venda/vendas";
    }

    @RequestMapping(value = "/cadastro/venda")
    public String cadastro() {
        return "principal/venda/realizar-venda";
    }
}
