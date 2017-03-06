<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

        <!-- REPRESENTANTE -->
        <li>
            <a class="blue-text text-darken-3 collapsible-header" style="margin-left: 15px;">
                <i class="material-icons blue-text text-darken-3">supervisor_account</i> Representante
                <i class="material-icons blue-text text-darken-3 right">arrow_drop_down</i>
            </a>
            <div class="collapsible-body grey lighten-4">
                <ul>
                    <li><a class="grey-text text-darken-3" onclick="$('.button-collapse').sideNav('hide');" href="#/cadastro/representante">Cadastrar Representante</a></li>
                    <li><a class="grey-text text-darken-3" onclick="$('.button-collapse').sideNav('hide');" href="#/visualizar/representantes">Visualizar</a></li>
                </ul>
            </div>
        </li>
        <!-- CLIENTE -->
        <li>
            <a class="blue-text text-darken-3 collapsible-header" style="margin-left: 15px;">
                <i class="material-icons blue-text text-darken-3">perm_identity</i> Cliente
                <i class="material-icons blue-text text-darken-3 right">arrow_drop_down</i>
            </a>
            <div class="collapsible-body grey lighten-4">
                <ul>
                    <li><a class="grey-text text-darken-3" onclick="$('.button-collapse').sideNav('hide');" href="#/cadastro/cliente">Cadastrar Cliente</a></li>
                    <li><a class="grey-text text-darken-3" onclick="$('.button-collapse').sideNav('hide');" href="#/visualizar/clientes">Visualizar</a></li>
                </ul>
            </div>
        </li>

        <!-- GERENCIAMENTO E CONTROLE -->
        <li style="margin-top: 20px"><div class="divider"></div></li>
        <li style="margin-top: 10px"><a class="subheader">Gerênciamento e controle</a></li>
        <!-- ESTOQUE -->
        <li>
            <a class="blue-text text-darken-3 collapsible-header" href="#/cadastro/estoque" style="margin-left: 15px; ">
                <i class="material-icons blue-text text-darken-3">store</i> Estoque
            </a>
        </li>
        <!-- VENDAS -->
        <li>
            <a class="blue-text text-darken-3 collapsible-header" style="margin-left: 15px; ">
                <i class="material-icons blue-text text-darken-3">shopping_cart</i> Vendas
                <i class="material-icons blue-text text-darken-3 right">arrow_drop_down</i>
            </a>
            <div class="collapsible-body grey lighten-4">
                <ul>
                    <li><a class="grey-text text-darken-3" onclick="$('.button-collapse').sideNav('hide');" href="#/visualizar/vendas">Visualizar Vendas</a></li>
                </ul>
            </div>
        </li>
