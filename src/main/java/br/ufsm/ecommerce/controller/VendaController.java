package br.ufsm.ecommerce.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class VendaController {

    @RequestMapping(value = "/visualizar/vendas")
    public String cadastro() {
        return "principal/venda/vendas";
    }
}
