<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- CAMINHO -->
<nav>
    <div class="nav-wrapper blue lighten-2">
        <div class="col s12">
            <a href="#" class="breadcrumb"></a>
            <a href="#" class="breadcrumb">Estoque</a>
            <a href="#" class="breadcrumb">Status do Estoque</a>
        </div>
    </div>
</nav>

<!-- CADASTRAR GRUPO -->
<div class="card grey lighten-5" style="margin-top: 2%">
    <div class="card-content">
        <!-- TITULO -->
        <i class="material-icons medium left grey-text text-darken-3 hide-on-small-only">store</i>
        <h4 class="thin grey-text text-darken-3">
            Status do Estoque
            <div class="chip red lighten-4 right"><span class="red-text text-lighten-1">Qtd <= 10%</span></div>
            <div class="chip yellow lighten-4 right"><span class="yellow-text text-darken-3">Qtd <= 20%</span></div>
            <div class="chip grey lighten-2 right">Ausente</div>
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

        <div ng-if="!loading && statusEstoque.length == 0" class="card grey lighten-5">
            <div class="card-content">
                <h4 class="title thin black-text">
                    Não há Produtos cadastrados
                </h4>
            </div>
        </div>

        <table class="bordered responsive-table" ng-if="statusEstoque.length > 0">
            <thead>
            <tr>
                <th class="center"><i class="material-icons prefix">dialpad</i></th>
                <th class="center"><i class="material-icons prefix">redeem</i></th>
                <th class="center">Em Estoque</th>
                <th class="center">Quant. Min.</th>
                <th class="center"><i class="material-icons left">settings</i></th>
            </tr>
            </thead>
            <tbody>
                <tr ng-repeat="status in statusEstoque" ng-class="{
                        'grey lighten-2 grey-text text-darken-2': status.quantidade <= 0,
                        'red lighten-5 red-text text-lighten-1': status.quantidade <= status.produto.qtdMinima * 0.1,
                        'yellow lighten-4 yellow-text text-darken-4': status.quantidade > status.produto.qtdMinima * 0.1 && status.quantidade <= status.produto.qtdMinima * 0.2
                    }">
                    <td class="center"><strong>{{status.produto.codigo}}</strong></td>
                    <td>{{status.produto.nome}}</td>
                    <td class="center"><strong>{{status.quantidade}}</strong></td>
                    <td class="center"><strong>{{status.produto.qtdMinima}}</strong></td>
                    <th class="center">
                        <a class="green-text" ng-click="" href=""><i class="material-icons left">add_circle</i></a>
                    </th>
                </tr>
            </tbody>
        </table>

        <br><br><br><br>

        <!-- MODAL REGISTRAR PRODUTO -->
        <c:import url="../estoque/modal-registrar-produto.jsp"/>

    </div> <!-- ./card-content -->
</div> <!-- ./card -->



