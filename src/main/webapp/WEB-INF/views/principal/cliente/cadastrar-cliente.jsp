<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- CAMINHO -->
<nav>
    <div class="nav-wrapper blue lighten-2">
        <div class="col s12">
            <a href="#" class="breadcrumb"></a>
            <a href="#" class="breadcrumb">Cliente</a>
            <a href="#" class="breadcrumb">Cadastrar Cliente</a>
        </div>
    </div>
</nav>

<!-- CADASTRAR REPRESENTANTE -->
<div class="card grey lighten-5" style="margin-top: 2%">
    <div class="card-content">
        <!-- TITULO -->
        <i class="material-icons medium left grey-text text-darken-3 hide-on-small-only">perm_identity</i>
        <h4 class="thin grey-text text-darken-3">
            Novo Cliente
        </h4>
        <br/>

        <!-- MENSAGEM -->
        <div style="margin-bottom: 20px">
            <c:import url="../../mensagens/mensagens.jsp"/>
        </div>
        <br/>

        <!-- FORMULARIO -->
        <div class="row">
            <!-- NOME -->
            <div class="input-field col l8 s12">
                <i class="material-icons prefix">account_circle</i>
                <input id="nome" type="text" name="nomeCompleto" ng-model="usuario.nomeCompleto" class="validate" maxlength="50">
                <label for="nome">Nome Completo</label>
            </div>
            <!-- EMAIL -->
            <div class="input-field col l4 s12">
                <i class="material-icons prefix">email</i>
                <input id="email" type="text" name="email" class="validate" ng-model="usuario.email" maxlength="50">
                <label for="email">Email</label>
            </div>
        </div>
        <div class="row">
            <!-- CPF / CNPJ -->
            <div class="input-field col l4 m6 s12">
                <i class="material-icons prefix">dialpad</i>
                <input id="cpf" type="text" name="cpf_cnpj" ng-model="usuario.cpf_cnpj" class="validate" ui-br-cpfcnpj-mask>
                <label for="cpf">CPF ou CNPJ</label>
            </div>
            <!-- TELEFONE 1 -->
            <div class="input-field col l4 m6 s12">
                <i class="material-icons prefix">call</i>
                <input id="telefone1" type="text" name="telefone1" ng-model="usuario.telefone1" class="validate" ui-br-phone-number>
                <label for="telefone1">Telefone 1</label>
            </div>
            <!-- TELEFONE 2 -->
            <div class="input-field col l4 m6 s12">
                <i class="material-icons prefix">call</i>
                <input id="telefone2" type="text" name="telefone2" ng-model="usuario.telefone2" class="validate" ui-br-phone-number>
                <label for="telefone2">Telefone 2</label>
            </div>
        </div>
        <div class="row">
            <!-- ENDEREÇO -->
            <div class="input-field col l8 s12">
                <i class="material-icons prefix">location_on</i>
                <input id="endereco" type="text" name="endereco" ng-model="usuario.endereco" class="validate">
                <label for="endereco">Endereço</label>
            </div>
            <!-- CEP -->
            <div class="input-field col l4 s12">
                <i class="material-icons prefix">location_on</i>
                <input id="cep" type="text" name="cep" ng-model="usuario.cep" class="validate" ui-br-cep-mask>
                <label for="cep">CEP</label>
            </div>
        </div>
        <br/>
        <div class="card-action">
            <div class="row">
                <div class="col l6 m6 s6">
                    <button ng-click="cadastrarCliente(usuario)" class="btn waves-effect waves-light blue lighten-2 left" type="button">Cadastrar
                        <i class="material-icons right">send</i>
                    </button>
                </div>
                <div class="col l6 m6 s6">
                    <button ng-click="limparFormulario()" class="btn-floating waves-effect waves-light green lighten-2 right" type="button">
                        <i class="material-icons right">replay</i>
                    </button>
                </div>
            </div>
        </div>
    </div> <!-- ./card-content -->
</div> <!-- ./card -->
