package br.ufsm.ecommerce.dao;

import br.ufsm.ecommerce.model.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDAO {
    private Connection conn = new PostgreSQLFactory().getConexao();
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;
    private String query;

    public Usuario autenticarUsuario(Usuario usuario) {

        Usuario usuarioAutenticado = null;

        query = " SELECT usuario.idusuario, nome, funcao.idfuncao, funcao " +
            " FROM usuario, funcao, usuario_funcao " +
            " WHERE usuario.idusuario = usuario_funcao.idusuario " +
            " AND funcao.idfuncao = usuario_funcao.idfuncao " +
            " AND email = ? AND senha = ?; ";

        try {
            preparedStatement = conn.prepareStatement(query);
                preparedStatement.setString(1, usuario.getEmail());
                preparedStatement.setString(2, usuario.getSenha());
            resultSet = preparedStatement.executeQuery();

            while (this.resultSet.next()) {
                usuarioAutenticado = new Usuario();
                    usuarioAutenticado.setIdUsuario(resultSet.getInt("idusuario"));
                    usuarioAutenticado.setNomeCompleto(resultSet.getString("nome"));
                    usuarioAutenticado.setIdFuncao(resultSet.getInt("idfuncao"));
                usuarioAutenticado.setFuncao(resultSet.getString("funcao"));
            }

        } catch (Exception e) { e.printStackTrace(); }

        new PostgreSQLFactory().fecharConexao(conn, preparedStatement, resultSet);

        return usuarioAutenticado;
    }

    public Usuario buscarUsuario(Usuario usuario) {

        Usuario buscarUsuario = null;

        query = " SELECT nome FROM usuario WHERE email = ?; ";

        try {
            preparedStatement = conn.prepareStatement(query);
            preparedStatement.setString(1, usuario.getEmail());
            resultSet = preparedStatement.executeQuery();

            while (this.resultSet.next()) {
                buscarUsuario = new Usuario();
                buscarUsuario.setNomeCompleto(resultSet.getString("nome"));
                buscarUsuario.setEmail(usuario.getEmail());
            }

        } catch (Exception e) { e.printStackTrace(); }

        new PostgreSQLFactory().fecharConexao(conn, preparedStatement, resultSet);

        return buscarUsuario;
    }

    public Usuario recuperarSenha(Usuario usuario) {

        query = " SELECT nome, email, senha FROM usuario WHERE email = ?; ";

        try {
            preparedStatement = conn.prepareStatement(query);
                preparedStatement.setString(1, usuario.getEmail());
            resultSet = preparedStatement.executeQuery();

            usuario = null;

            while (this.resultSet.next()) {
                usuario = new Usuario();
                usuario.setNomeCompleto(resultSet.getString("nome"));
                usuario.setEmail(resultSet.getString("email"));
                usuario.setSenha(resultSet.getString("senha"));
            }

        } catch (Exception e) { e.printStackTrace(); }

        new PostgreSQLFactory().fecharConexao(conn, preparedStatement, resultSet);

        return usuario;
    }
}
