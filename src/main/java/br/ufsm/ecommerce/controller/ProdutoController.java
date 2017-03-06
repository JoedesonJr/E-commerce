package br.ufsm.ecommerce.controller;

import br.ufsm.ecommerce.dao.ProdutoDAO;
import br.ufsm.ecommerce.model.Mensagem;
import br.ufsm.ecommerce.model.Produto;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.SQLException;
import java.util.ArrayList;

@Controller
public class ProdutoController {

    // ROTAS
    @RequestMapping(value = "/cadastro/produto")
    public String cadastro() { return "principal/produto/cadastrar-produto"; }

    @RequestMapping(value = "/visualizar/produtos")
    public String visualizar() { return "principal/produto/visualizar-produtos"; }

    @RequestMapping("cadastrarProduto")
    public ResponseEntity<Mensagem> cadastrarProduto (@RequestBody Produto produto) throws SQLException {

        if(new ProdutoDAO().cadastrarProduto(produto)) {
            return new ResponseEntity<Mensagem>(
                new Mensagem("OK", "Cadastro efetuado com sucesso."), HttpStatus.OK);
        } else {
            return new ResponseEntity<Mensagem>(
                new Mensagem("ERRO", "Já existe um Produto com este código."), HttpStatus.OK);
        }
    }

    @RequestMapping("getProdutos")
    public ResponseEntity<ArrayList<Produto>> getProdutos() {
        return new ResponseEntity<ArrayList<Produto>>(
            new ProdutoDAO().getProdutos(),HttpStatus.OK);
    }

    @RequestMapping("atualizarProduto")
    public ResponseEntity<Mensagem> atualizarProduto(@RequestBody Produto produto) throws SQLException {

        if(new ProdutoDAO().atualizarProduto(produto)) {
            return new ResponseEntity<Mensagem>(
                new Mensagem("OK", "Produto atualizado com sucesso."), HttpStatus.OK);
        } else {
            return new ResponseEntity<Mensagem>(
                new Mensagem("ERRO", "Já possui um produto com este código, tente novamente."), HttpStatus.OK);
        }
    }

    @RequestMapping("removerProduto")
    public ResponseEntity<Mensagem> removerProduto(@RequestBody Produto produto) throws SQLException {

        if(new ProdutoDAO().removerProduto(produto.getIdProduto())) {
            return new ResponseEntity<Mensagem>(
                new Mensagem("OK", "Produto removido com sucesso."), HttpStatus.OK);
        } else {
            return new ResponseEntity<Mensagem>(
                new Mensagem("ERRO", "Produto não removido, tente novamente."), HttpStatus.OK);
        }
    }
}
