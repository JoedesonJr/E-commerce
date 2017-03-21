<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- CAMINHO -->
<nav>
    <div class="nav-wrapper blue lighten-2">
        <div class="col s12">
            <a href="#" class="breadcrumb"></a>
            <a href="#" class="breadcrumb">Estoque</a>
            <a href="#" class="breadcrumb">Produtos em Estoque</a>
        </div>
    </div>
</nav>

<!-- CADASTRAR GRUPO -->
<div class="card grey lighten-5" style="margin-top: 2%">
    <div class="card-content">
        <!-- TITULO -->
        <i class="material-icons medium left grey-text text-darken-3 hide-on-small-only">store</i>
        <h4 class="thin grey-text text-darken-3">
            Produtos em Estoque
            <a ng-click="modalRegistrarProduto()" class="btn-floating waves-effect waves-light blue lighten-2 right" style="margin-left: 30px">
                <i class="material-icons">add</i>
            </a>
            <div class="chip red lighten-4 right" style="margin-top: 5px"><span class="red-text text-lighten-1">Não Disponível</span></div>
            <div class="chip green lighten-4 right" style="margin-top: 5px"><span class="green-text text-darken-3">Disponível</span></div>
        </h4>
        <br/><br/>

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

        <div ng-if="!loading && estoques.length == 0" class="card grey lighten-5">
            <div class="card-content">
                <h4 class="title thin black-text">
                    Não há Produtos cadastrados
                </h4>
            </div>
        </div>

        <table class="bordered striped responsive-table" ng-if="estoques.length > 0">
            <thead>
            <tr>
                <td class="center" title="Código"><i class="material-icons prefix">dialpad</i></td>
                <th class="center" title="Produto"><i class="material-icons prefix">redeem</i></th>
                <th class="center" title="Lote"><i class="material-icons prefix">view_module</i></th>
                <th class="center" title="Preço"><i class="material-icons prefix">attach_money</i></th>
                <th class="center" title="ST"><i class="material-icons prefix">gavel</i></th>
                <th class="center" title="Custo Transporte"><i class="material-icons prefix">local_shipping</i></th>
                <th class="center" title="Validade"><i class="material-icons prefix">today</i></th>
                <th class="center" title="Quantidade"><i class="material-icons prefix">settings_ethernet</i></th>
                <th class="center" title="Editar"><i class="material-icons prefix">settings</i></th>
            </tr>
            </thead>
            <tbody>
                <tr ng-repeat="e in estoques" ng-class="{
                        'green lighten-5 green-text text-darken-3': e.disponivel,
                        'red lighten-5 red-text text-lighten-1': !e.disponivel
                    }">
                    <td class="center"><strong>{{e.produto.codigo}}</strong></td>
                    <td>{{e.produto.nome}}</td>
                    <td class="center ">{{e.lote == null ? '-' : e.lote}}</td>
                    <td class="center"><strong>{{e.preco | currency}}</strong></td>
                    <td class="center"><strong>{{e.st | currency}}</strong></td>
                    <td class="center"><strong>{{e.transporte | currency}}</strong></td>
                    <td class="center">{{e.validade == null ? '-' : e.validade | date: "d MMMM, yyyy"}}</td>
                    <td class="center"><strong>{{e.quantidade}}</strong></td>
                    <td class="center">
                        <a class="green-text" ng-click="modalEditarProduto(e)" href=""><i class="material-icons">build</i></a>
                    </td>
                </tr>
            </tbody>
        </table>

        <br><br><br><br>

        <!-- MODAL EDITAR PRODUTO -->
        <c:import url="../estoque/modal-editar-produto.jsp"/>

        <!-- MODAL REGISTRAR PRODUTO -->
        <c:import url="../estoque/modal-registrar-produto.jsp"/>

    </div> <!-- ./card-content -->
</div> <!-- ./card -->



