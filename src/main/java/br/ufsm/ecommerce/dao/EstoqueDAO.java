package br.ufsm.ecommerce.dao;

import br.ufsm.ecommerce.model.Estoque;
import br.ufsm.ecommerce.model.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class EstoqueDAO {

    private Connection conn = new PostgreSQLFactory().getConexao();
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;
    private String query;
    private boolean status = false;

    public ArrayList<Estoque> getEstoque() {

        ArrayList<Estoque> estoques = new ArrayList<Estoque>();

        query = " SELECT idestoque, codigoproduto, nomeproduto, medida, preco, disponivel, " +
            " st, lote, validade, quantidade, qtdminima, transporte FROM estoque, produto " +
            " WHERE produto.idproduto = estoque.idproduto ORDER BY codigoproduto, lote; ";

        try {
            preparedStatement = conn.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            while (this.resultSet.next()) {
                Estoque estoque = new Estoque();
                    estoque.setIdEstoque(resultSet.getInt("idestoque"));
                    Produto produto = new Produto();
                        produto.setNome(resultSet.getString("nomeproduto"));
                        produto.setCodigo(resultSet.getString("codigoproduto"));
                        produto.setMedida(resultSet.getString("medida"));
                    estoque.setProduto(produto);
                    estoque.setPreco(resultSet.getFloat("preco"));
                    estoque.setSt(resultSet.getInt("st"));
                    estoque.setLote(resultSet.getString("lote"));
                    estoque.setValidade(resultSet.getDate("validade"));
                    estoque.setQuantidade(resultSet.getInt("quantidade"));
                    estoque.setQtdMinima(resultSet.getInt("qtdminima"));
                    estoque.setTransporte(resultSet.getFloat("transporte"));
                    estoque.setDisponivel(resultSet.getBoolean("disponivel"));
                estoques.add(estoque);
            }

        } catch (Exception e) { e.printStackTrace(); }

        new PostgreSQLFactory().fecharConexao(conn, preparedStatement, resultSet);

        return estoques;
    }

    public boolean editarProduto(Estoque estoque) throws Exception {

        query = " UPDATE estoque SET quantidade = ?, preco = ?, st = ?, disponivel = ?, " +
            " lote = ?, validade = ?, transporte = ? WHERE idestoque = ?;";

        preparedStatement = conn.prepareStatement(query);
            preparedStatement.setInt(1, estoque.getQuantidade());
            preparedStatement.setFloat(2, estoque.getPreco());
            preparedStatement.setInt(3, estoque.getSt());
            preparedStatement.setBoolean(4, estoque.isDisponivel());
            preparedStatement.setString(5, estoque.getLote());
            preparedStatement.setDate(6, estoque.getValidade());
            preparedStatement.setFloat(7, estoque.getTransporte());
            preparedStatement.setInt(8, estoque.getIdEstoque());
        preparedStatement.execute();

        if(preparedStatement.getUpdateCount() > 0) status = true;

        conn.close();
        preparedStatement.close();

        return status;
    }

    public ArrayList<Estoque> getStatusEstoque() {

        ArrayList<Estoque> statusEstoque = new ArrayList<Estoque>();

        query = " SELECT produto.idproduto, codigoproduto, nomeproduto, qtdminima, SUM(quantidade) AS quantidade " +
            " FROM produto, estoque " +
            " WHERE produto.idproduto = estoque.idproduto " +
            " GROUP BY produto.idproduto, codigoproduto, nomeproduto, qtdminima ORDER BY codigoproduto; ";

        try {
            preparedStatement = conn.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            while (this.resultSet.next()) {
                Produto produto = new Produto();
                    produto.setIdProduto(resultSet.getInt("idproduto"));
                    produto.setCodigo(resultSet.getString("codigoproduto"));
                    produto.setNome(resultSet.getString("nomeproduto"));
                    produto.setQtdMinima(resultSet.getInt("qtdminima"));
                Estoque estoque = new Estoque();
                    estoque.setProduto(produto);
                    estoque.setQuantidade(resultSet.getInt("quantidade"));
                statusEstoque.add(estoque);
            }

        } catch (Exception e) { e.printStackTrace(); }

        new PostgreSQLFactory().fecharConexao(conn, preparedStatement, resultSet);

        return statusEstoque;

    }
}
