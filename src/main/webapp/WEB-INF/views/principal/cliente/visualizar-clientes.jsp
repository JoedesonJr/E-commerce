<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- CAMINHO -->
<nav>
    <div class="nav-wrapper blue lighten-2">
        <div class="col s12">
            <a href="#" class="breadcrumb"></a>
            <a href="#" class="breadcrumb">Cliente</a>
            <a href="#" class="breadcrumb">Visualizar/ Editar</a>
        </div>
    </div>
</nav>

<!-- CADASTRAR GRUPO -->
<div class="card grey lighten-5" style="margin-top: 2%">
    <div class="card-content">
        <!-- TITULO -->
        <i class="material-icons medium left grey-text text-darken-3 hide-on-small-only">perm_identity</i>
        <h4 class="thin grey-text text-darken-3">

            <span ng-if="usuarios.length == 0 && !loading">Não há clientes cadastrados</span>
            <span ng-if="usuarios.length > 0">Clientes</span>
        </h4>
        <br/>

        <!-- MENSAGEM -->
        <div style="margin-bottom: 20px">
            <c:import url="../../mensagens/mensagens.jsp"/>
        </div>

        <div ng-if="loading" class="card grey lighten-5">
            <div class="card-content">
                <div class="progress">
                    <div class="indeterminate"></div>
                </div>
                <h5 class="title thin black-text">
                    Carregando... Aguarde.
                </h5>
            </div>
        </div>

        <ul class="collection" ng-if="usuarios.length > 0">
            <li class="collection-item grey lighten-4" ng-repeat="u in usuarios">
                <div class="row">
                    <div class="col l9 md9 s9">
                        <span class="title thin blue-text lighten-2">
                            <strong>{{u.nomeCompleto}}  / CPF/ CNPJ: {{u.cpf_cnpj}}</strong>
                        </span>
                        <p>
                            {{u.email}}<br>
                            <span class="grey-text text-darken-1">{{u.endereco}}</span>
                        </p>
                    </div>
                    <div class="col l3 m3 s3 right-align">
                        <br/>
                        <!-- EDITAR CLIENTE -->
                        <a ng-click="modalCliente(u, 'editar')" href="" class="green-text">
                            <i class="material-icons">mode_edit</i>
                        </a>

                        <span class="hide-on-small-only">&nbsp;&nbsp;</span>

                        <!-- REMOVER CLIENTE -->
                        <a ng-click="modalCliente(u, 'remover')" href="" class="red-text">
                            <i class="material-icons">delete</i>
                        </a>
                    </div>
                </div>
            </li>
        </ul>
    </div> <!-- ./card-content -->
</div> <!-- ./card -->

<!-- MODAL CLIENTE: REMOVER/EDITAR -->
<c:import url="modal-cliente.jsp"/>
