<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- CAMINHO -->
<nav>
    <div class="nav-wrapper blue lighten-2">
        <div class="col s12">
            <a href="#" class="breadcrumb"></a>
            <a href="#" class="breadcrumb">Grupo</a>
            <a href="#" class="breadcrumb">Visualizar/ Editar</a>
        </div>
    </div>
</nav>

<!-- CADASTRAR GRUPO -->
<div class="card grey lighten-5" style="margin-top: 2%">
    <div class="card-content">
        <!-- TITULO -->
        <i class="material-icons medium left grey-text text-darken-3">dashboard</i>
        <h4 class="thin grey-text text-darken-3">
            <span ng-if="grupos.length == 0 && !loading">Não há grupos cadastrados</span>
            <span ng-if="grupos.length > 0">Grupos</span>
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

        <ul class="collection with-header" ng-if="grupos.length > 0">
            <li class="collection-item grey lighten-4" ng-repeat="g in grupos">
                <div> {{g.grupo}}
                    <!-- REMOVER GRUPO -->
                    <a ng-click="modalGrupo(g, 'remover')" href="" class="secondary-content red-text">
                        <i class="material-icons">delete</i>
                    </a>
                    <!-- EDITAR GRUPO -->
                    <a ng-click="modalGrupo(g, 'editar')" href="" class="secondary-content green-text">
                        <i class="material-icons" style="margin-right: 18px">mode_edit</i>
                    </a>
                </div>
            </li>
        </ul>
    </div> <!-- ./card-content -->
</div> <!-- ./card -->

<!-- MODAL GRUPO: REMOVER/EDITAR -->
<c:import url="modal-grupo.jsp"/>
