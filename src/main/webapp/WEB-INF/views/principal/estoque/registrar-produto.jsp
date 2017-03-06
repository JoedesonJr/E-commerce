<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- CAMINHO -->
<nav>
    <div class="nav-wrapper blue lighten-2">
        <div class="col s12">
            <a href="#" class="breadcrumb"></a>
            <a href="#" class="breadcrumb">Estoque</a>
        </div>
    </div>
</nav>

<!-- CADASTRAR GRUPO -->
<div class="card grey lighten-5" style="margin-top: 2%">
    <div class="card-content">
        <!-- TITULO -->
        <i class="material-icons medium left grey-text text-darken-3 hide-on-small-only">store</i>
        <h4 class="thin grey-text text-darken-3">
            Estoque
            <div class="chip red lighten-4 right"><span class="red-text text-lighten-1">Qtd <= 10%</span></div>
            <div class="chip yellow lighten-4 right"><span class="yellow-text text-darken-3">Qtd <= 20%</span></div>
            <div class="chip grey lighten-2 right">Ausente</div>
        </h4>
        <br/><br/>

        <table class="bordered responsive-table">
            <thead>
            <tr>
                <th class="center"><i class="material-icons prefix">dialpad</i></th>
                <th class="center"><i class="material-icons prefix">redeem</i></th>
                <th class="center"><i class="material-icons prefix">attach_money</i></th>
                <th class="center"><i class="material-icons prefix">gavel</i></th>
                <th class="center"><i class="material-icons prefix">view_module</i></th>
                <th class="center"><i class="material-icons prefix">today</i></th>
                <th class="center">Qtd/ Min</th>
                <th class="center"><i class="material-icons left">settings</i></th>
            </tr>
            </thead>
            <tbody>
                <tr ng-repeat="e in estoques" ng-class="{
                    'grey lighten-2': !e.preco && !e.st && !e.lote && !e.validade && !e.quantidade && !e.qtdMinima,
                    'yellow lighten-4': e.qtMinima * 0.2 >= e.quantidade,
                    'red lighten-4': e.qtMinima * 0.1 >= e.quantidade
                    }">
                    <td class="center">{{e.produto.codigo}}</td>
                    <td class="title thin black-text">{{e.produto.nome}}</td>
                    <td class="center">{{e.preco | currency}}</td>
                    <td class="center">{{e.st | currency}}</td>
                    <td class="center">{{e.lote == null ? '-' : e.lote}}</td>
                    <td class="center">{{e.validade == null ? '-' : e.validade}}</td>
                    <td class="center"><strong>{{e.quantidade}}/{{e.qtdMinima}}</strong></td>
                    <th class="center">
                        <a class="green-text" ng-click="modalRegistrarProduto(e)" href=""><i class="material-icons left">build</i></a>
                    </th>
                </tr>
            </tbody>
        </table>

        <br><br><br><br>

        <!-- MODAL REGISTRAR PRODUTO -->
        <c:import url="../estoque/modal-registrar-produto.jsp"/>

    </div> <!-- ./card-content -->
</div> <!-- ./card -->



