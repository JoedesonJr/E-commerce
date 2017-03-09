<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- CAMINHO -->
<nav>
    <div class="nav-wrapper blue lighten-2">
        <div class="col s12">
            <a href="#" class="breadcrumb"></a>
            <a href="#" class="breadcrumb">Vendas</a>
            <a href="#" class="breadcrumb">Cartões de Crédito</a>
        </div>
    </div>
</nav>

<!-- CADASTRAR GRUPO -->
<div class="card grey lighten-5" style="margin-top: 2%">
    <div class="card-content">
        <!-- TITULO -->
        <i class="material-icons medium left grey-text text-darken-3">credit_card</i>
        <h4 class="thin grey-text text-darken-3">
            Cartões de Créditos Aceitos
        </h4>
        <br/><br/>

        <ul class="collection with-header">
            <li class="collection-item" ng-repeat="cartao in cartoes">
                <div>
                    <input type="checkbox" id="{{cartao.idCartao}}" ng-model="cartao.aceito" ng-checked="cartao.aceito"/>
                    <label for="{{cartao.idCartao}}">{{cartao.bandeira}}</label>
                    <i class="secondary-content material-icons blue-text">credit_card</i>
                </div>
            </li>
        </ul>
        <br/>

        <div class="card-action">
            <button ng-click="cadastrarCartoes(cartoes)" class="btn waves-effect waves-light blue lighten-2 leftn" type="button">CONFIRMAR
                <i class="material-icons right">send</i>
            </button>
        </div>
    </div> <!-- ./card-content -->
</div> <!-- ./card -->
<br/>


