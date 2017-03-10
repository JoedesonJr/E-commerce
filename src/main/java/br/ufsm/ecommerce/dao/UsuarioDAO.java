package br.ufsm.ecommerce.dao;

import br.ufsm.ecommerce.model.Telefone;
import br.ufsm.ecommerce.model.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UsuarioDAO {

    private Connection conn = new PostgreSQLFactory().getConexao();
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;
    private String query;
    private boolean status = false;

    public boolean cadastrarUsuario(Usuario usuario) throws SQLException {

        query = " BEGIN; " +
            " INSERT INTO usuario (cpf_cnpj, nome, email, endereco, senha) VALUES (?, ?, ?, ?, ?); " +
            " INSERT INTO usuario_funcao (SELECT currval(pg_get_serial_sequence('usuario','idusuario')), ?); ";

        if(usuario.getIdFuncao() == 3) {
            query += " INSERT INTO cliente_representante (SELECT currval(pg_get_serial_sequence('usuario','idusuario')), ?); ";
        }
        for (Telefone telefone: usuario.getTelefone()) {
            query += " INSERT INTO telefone (idusuario, telefone) (SELECT currval(pg_get_serial_sequence('usuario','idusuario')), ?); ";
        }

        query += " COMMIT; ";

        try {
            preparedStatement = conn.prepareStatement(query);
            preparedStatement.setString(1, usuario.getCpf_cnpj());
            preparedStatement.setString(2, usuario.getNomeCompleto());
            preparedStatement.setString(3, usuario.getEmail());
            preparedStatement.setString(4, usuario.getEndereco());
            preparedStatement.setString(5, usuario.getSenha());
            preparedStatement.setInt(6, usuario.getIdFuncao());

            int index = 6;
            if(usuario.getIdFuncao() == 3) {
                preparedStatement.setInt(7, usuario.getIdUsuario());
                index++;
            }
            for (Telefone telefone: usuario.getTelefone()) {
                index++;
                preparedStatement.setString(index, telefone.getTelefone());
            }

            preparedStatement.execute();

            status = true;
        } catch (Exception e) { e.printStackTrace(); }

        conn.close();
        preparedStatement.close();

        return status;
    }

    public ArrayList<Usuario> getUsuarios(int idFuncao, int idUsuario, int funcao) {

        ArrayList<Usuario> usuarios = new ArrayList<Usuario>();

        if(funcao == 2) {
            query = " SELECT * FROM usuario, usuario_funcao, cliente_representante " +
                " WHERE usuario.idusuario = usuario_funcao.idusuario " +
                " AND usuario_funcao.idfuncao = ? " +
                " AND usuario.idusuario = cliente_representante.idcliente " +
                " AND cliente_representante.idrepresentante = ?; ";
        } else {
            query = " SELECT * FROM usuario, usuario_funcao" +
                " WHERE usuario.idusuario = usuario_funcao.idusuario " +
                " AND usuario_funcao.idfuncao = ?; ";
        }

        try {
            preparedStatement = conn.prepareStatement(query);
                preparedStatement.setInt(1, idFuncao);
                if(funcao == 2) {
                    preparedStatement.setInt(2, idUsuario);
                }
            resultSet = preparedStatement.executeQuery();

            ArrayList<Telefone> telefones = getTelefones(idFuncao);

            while (this.resultSet.next()) {
                Usuario usuario = new Usuario();
                    usuario.setIdUsuario(resultSet.getInt("idusuario"));
                    usuario.setNomeCompleto(resultSet.getString("nome"));
                    usuario.setEmail(resultSet.getString("email"));
                    usuario.setCpf_cnpj(resultSet.getString("cpf_cnpj"));

                    String cep[] = resultSet.getString("endereco").split(" - CEP: ");
                    usuario.setEndereco(cep[0]);
                    usuario.setCEP(cep[1]);

                    ArrayList<Telefone> telefone = new ArrayList<Telefone>();

                    for(int i=0; i<telefones.size(); i++) {
                        if(usuario.getIdUsuario() == telefones.get(i).getIdUsuario()) {
                            Telefone tel = new Telefone();
                                tel.setIdUsuario(telefones.get(i).getIdUsuario());
                                tel.setIdTelefone(telefones.get(i).getIdTelefone());
                                tel.setTelefone(telefones.get(i).getTelefone());
                            telefone.add(tel);
                        }
                    }
                    if(telefone != null) {
                        usuario.setTelefone(telefone);
                    }

                usuarios.add(usuario);
            }

        } catch (Exception e) { e.printStackTrace(); }

        new PostgreSQLFactory().fecharConexao(conn, preparedStatement, resultSet);

        return usuarios;
    }

    private ArrayList<Telefone> getTelefones(int idFuncao) {

        Connection con = new PostgreSQLFactory().getConexao();
        PreparedStatement prepared = null;
        ResultSet rs = null;

        ArrayList<Telefone> telefones = new ArrayList<Telefone>();

        String query = " SELECT telefone.idusuario, idtelefone, telefone" +
            " FROM telefone, usuario_funcao" +
            " WHERE telefone.idusuario = usuario_funcao.idusuario" +
            " AND usuario_funcao.idfuncao = ?; ";

        try {
            prepared = con.prepareStatement(query);
            prepared.setInt(1, idFuncao);
            rs = prepared.executeQuery();

            while (rs.next()) {
                Telefone telefone = new Telefone();
                    telefone.setIdUsuario(rs.getInt("idusuario"));
                    telefone.setIdTelefone(rs.getInt("idtelefone"));
                    telefone.setTelefone(rs.getString("telefone"));
                telefones.add(telefone);
            }

        } catch (Exception e) { e.printStackTrace(); }

        new PostgreSQLFactory().fecharConexao(con, prepared, rs);

        return telefones;
    }

    public boolean removerUsuario(int idUsuario) throws Exception{

        query = " BEGIN; " +
            " DELETE FROM telefone WHERE idusuario = ?; " +
            " DELETE FROM usuario_funcao WHERE idusuario = ?; " +
            " DELETE FROM cliente_representante WHERE idcliente = ?; " +
            " DELETE FROM usuario WHERE idusuario = ?;" +
            " COMMIT; ";

        try {
            preparedStatement = conn.prepareStatement(query);
                preparedStatement.setInt(1, idUsuario);
                preparedStatement.setInt(2, idUsuario);
                preparedStatement.setInt(3, idUsuario);
                preparedStatement.setInt(4, idUsuario);
            preparedStatement.execute();

            status = true;
        } catch (Exception e) { e.printStackTrace(); }

        conn.close();
        preparedStatement.close();

        return status;
    }

    public boolean atualizarUsuario(Usuario usuario) throws SQLException {

        query = " UPDATE usuario SET cpf_cnpj = ?, nome = ?, email = ?, " +
            " endereco = ? WHERE idusuario = ?; ";

        try {
            preparedStatement = conn.prepareStatement(query);
                preparedStatement.setString(1, usuario.getCpf_cnpj());
                preparedStatement.setString(2, usuario.getNomeCompleto());
                preparedStatement.setString(3, usuario.getEmail());
                preparedStatement.setString(4, usuario.getEndereco());
                preparedStatement.setInt(5, usuario.getIdUsuario());
            preparedStatement.execute();

            status = atualizarTelefones(usuario.getTelefone());

        } catch (Exception e) { e.printStackTrace(); }

        conn.close();
        preparedStatement.close();

        return status;
    }

    private boolean atualizarTelefones(ArrayList<Telefone> telefones) throws SQLException {

        Connection con = new PostgreSQLFactory().getConexao();
        PreparedStatement prepared = null;
        boolean retorno = false;

        query = " BEGIN; ";
        for (Telefone telefone : telefones) {
            if(telefone.getTelefone() != null && telefone.getTelefone() != "") {
                query += " UPDATE telefone SET telefone = ? WHERE idtelefone = ?; ";
            }
        }
        query += " COMMIT; ";

        try {
            prepared = con.prepareStatement(query);
                int index = 0;
                for (Telefone telefone : telefones) {
                    if(telefone.getTelefone() != null && telefone.getTelefone() != "") {
                        index++;
                        prepared.setString(index, telefone.getTelefone());
                        index++;
                        prepared.setInt(index, telefone.getIdTelefone());
                    }
                }
            prepared.execute();

            retorno = true;

        } catch (Exception e) { e.printStackTrace(); }

        con.close();
        prepared.close();

        return retorno;
    }

    public boolean alterarSenha(Usuario usuario) throws SQLException{

        query = " UPDATE usuario SET senha = ? WHERE idusuario = ?; ";

        try {
            preparedStatement = conn.prepareStatement(query);
                preparedStatement.setString(1, usuario.getNovaSenha());
                preparedStatement.setInt(2, usuario.getIdUsuario());
            preparedStatement.execute();

            status = true;

        } catch (Exception e) { e.printStackTrace(); }

        conn.close();
        preparedStatement.close();

        return status;
    }
}
