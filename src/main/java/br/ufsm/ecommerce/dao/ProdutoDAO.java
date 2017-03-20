package br.ufsm.ecommerce.dao;

import br.ufsm.ecommerce.model.Grupo;
import br.ufsm.ecommerce.model.Mensagem;
import br.ufsm.ecommerce.model.Produto;
import org.springframework.http.ResponseEntity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProdutoDAO {

    private Connection conn = new PostgreSQLFactory().getConexao();
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;
    private String query;
    private boolean status = false;

    public boolean cadastrarProduto(Produto produto) throws SQLException {

        query = " BEGIN; " +
            " INSERT INTO produto (idproduto, codigoproduto, nomeproduto, medida, descricao, idgrupo, foto, qtdminima) " +
            " VALUES (DEFAULT, ?, ?, ?, ?, ?, ?, ?); " +
            " INSERT INTO estoque (idproduto, disponivel) (SELECT currval(pg_get_serial_sequence('produto','idproduto')), false); " +
            " COMMIT; ";

        try {
            preparedStatement = conn.prepareStatement(query);
                preparedStatement.setInt(1, Integer.parseInt(produto.getCodigo()));
                preparedStatement.setString(2, produto.getNome());
                preparedStatement.setString(3, produto.getMedida());
                preparedStatement.setString(4, produto.getDescricao());
                preparedStatement.setInt(5, produto.getIdGrupo());
                preparedStatement.setString(6, produto.getFoto());
                preparedStatement.setInt(7, produto.getQtdMinima());
            preparedStatement.execute();

            status = true;
        } catch (Exception e) { e.printStackTrace(); }

        conn.close();
        preparedStatement.close();

        return status;
    }

    public ArrayList<Produto> getProdutos() {

        ArrayList<Produto> produtos = new ArrayList<Produto>();

        query = " SELECT idproduto, codigoproduto, nomeproduto, medida, descricao, foto, nomegrupo, produto.idgrupo, qtdminima" +
            " FROM produto, grupo " +
            " WHERE produto.idgrupo = grupo.idgrupo ORDER BY codigoproduto; ";

        try {
            preparedStatement = conn.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            while (this.resultSet.next()) {
                Produto produto = new Produto();
                    produto.setIdProduto(resultSet.getInt("idproduto"));
                    produto.setCodigo(resultSet.getString("codigoproduto"));
                    produto.setNome(resultSet.getString("nomeproduto"));
                    produto.setMedida(resultSet.getString("medida"));
                    produto.setDescricao(resultSet.getString("descricao"));
                    produto.setFoto(resultSet.getString("foto"));
                    produto.setGrupo(resultSet.getString("nomegrupo"));
                    produto.setIdGrupo(resultSet.getInt("idgrupo"));
                    produto.setQtdMinima(resultSet.getInt("qtdminima"));
                produtos.add(produto);
            }

        } catch (Exception e) { e.printStackTrace(); }

        new PostgreSQLFactory().fecharConexao(conn, preparedStatement, resultSet);

        return produtos;
    }

    public boolean removerProduto(int idProduto) throws SQLException {

        query = " BEGIN; " +
            " DELETE FROM estoque WHERE idProduto = ?; " +
            " DELETE FROM produto WHERE idProduto = ?; " +
            " COMMIT; ";

        preparedStatement = conn.prepareStatement(query);
            preparedStatement.setInt(1, idProduto);
            preparedStatement.setInt(2, idProduto);
        preparedStatement.execute();

        status = true;

        conn.close();
        preparedStatement.close();

        return status;
    }

    public boolean atualizarProduto(Produto produto) throws SQLException {

        query = " UPDATE produto SET foto = ?, idgrupo = ?, nomeproduto = ?, " +
            " codigoproduto = ?, medida = ?, descricao = ?, qtdminima = ? WHERE idproduto = ?;";

        try {
            preparedStatement = conn.prepareStatement(query);
                preparedStatement.setString(1, produto.getFoto());
                preparedStatement.setInt(2, produto.getIdGrupo());
                preparedStatement.setString(3, produto.getNome());
                preparedStatement.setInt(4, Integer.parseInt(produto.getCodigo()));
                preparedStatement.setString(5, produto.getMedida());
                preparedStatement.setString(6, produto.getDescricao());
            preparedStatement.setInt(7, produto.getQtdMinima());
                preparedStatement.setInt(8, produto.getIdProduto());
            preparedStatement.execute();

            status = true;
        } catch (Exception e) { e.printStackTrace(); }

        conn.close();
        preparedStatement.close();

        return status;
    }
}
