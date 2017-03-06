<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- CAMINHO -->
<nav>
    <div class="nav-wrapper blue lighten-2">
        <div class="col s12">
            <a href="#" class="breadcrumb"></a>
            <a href="#" class="breadcrumb">Produto</a>
            <a href="#" class="breadcrumb">Visualizar/ Editar</a>
        </div>
    </div>
</nav>

<!-- CADASTRAR GRUPO -->
<div class="card grey lighten-5" style="margin-top: 2%">
    <div class="card-content">
        <!-- TITULO -->
        <i class="material-icons medium left grey-text text-darken-3 hide-on-small-only">redeem</i>
        <h4 class="thin grey-text text-darken-3">
            <span ng-if="produtos.length == 0">Não há produtos cadastrados</span>
            <span ng-if="produtos.length > 0">Produtos</span>
        </h4>
        <br/>

        <!-- MENSAGEM -->
        <div style="margin-bottom: 20px">
            <c:import url="../../mensagens/mensagens.jsp"/>
        </div>

        <ul class="collection" ng-if="produtos">
            <li class="collection-item avatar grey lighten-4" ng-repeat="p in produtos">
                <div class="row">
                    <div class="col l11 md10 s9">
                        <img ng-src="{{p.foto}}" alt="{{p.nome}}" class="circle responsive-img">
                        <span class="title thin black-text">{{p.nome}}  -  {{p.medida}}</span>
                        <p>{{p.grupo}}</p>
                    </div>
                    <div class="col l1 m2 s3">
                        <!-- EDITAR PRODUTO -->
                        <a ng-click="modalProduto(p, 'editar')" href="" class="secondary-content green-text" style="margin-right: 40px; margin-top: 15px;">
                            <i class="material-icons">mode_edit</i>
                        </a>
                        <!-- REMOVER PRODUTO -->
                        <a ng-click="modalProduto(p, 'remover')" href="" class="secondary-content red-text" style="margin-top: 15px;">
                            <i class="material-icons">delete</i>
                        </a>
                    </div>
                </div>
                <div style="margin-left: 10px;"><span class="grey-text text-darken-1">{{p.descricao}}</span></div>
            </li>
        </ul>
    </div> <!-- ./card-content -->
</div> <!-- ./card -->

<!-- MODAL PRODUTO: REMOVER/EDITAR -->
<c:import url="modal-produto.jsp"/>



