<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!-- MENU -->
<div class="navbar-fixed">
    <nav>
        <li class="nav-wrapper grey darken-3">
            <ul id="nav-mobile" class="right">
                <li><a class='dropdown-button btn transparent' href='' data-activates='configuracoes'>
                    <i class="material-icons medium">settings</i>
                </a></li>

                <!-- CONFIGURACOES -->
                <ul id='configuracoes' class='dropdown-content' style='min-width: 200px;'>
                    <li>
                        <a ng-click="modalAlterarSenha()" href="">
                            <i class="material-icons left">vpn_key</i> Alterar senha
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="logout"><i class="material-icons left">power_settings_new</i> Sair</a></li>
                </ul>
            </ul>

            <a href="" data-activates="slide-out" class="button-collapse"><i class="material-icons">menu</i></a>
        </li>
    </nav>
</div>

<!-- MENU LATERAL -->
<ul id="slide-out" class="side-nav fixed grey lighten-4 blue-text text-darken-3">
    <li>
        <!-- MENU USUARIO -->
        <div class="userView background grey darken-3" style="height: 100%">
            <div class="row">
                <div class="col s4">
                    <img class="circle" src="<c:url value='/resources/img/icon-user.svg'/>">
                </div>
                <div class="col s8">
                    <span class="light-green-text text-lighten-3 name">${usuarioLogado.nomeCompleto}</span>
                    <span class="grey-text text-lighten-1 email">${usuarioLogado.funcao}</span>
                </div>
            </div>
        </div>
    </li>

    <li style="margin-top: 20px"><a class="subheader">Cadastros</a></li>
    <li class="no-padding fixed">
        <ul class="collapsible collapsible-accordion">

            <!-- MENU DISTRIBUIDOR -->
            <c:if test="${usuarioLogado.idFuncao == 1}">
                <span ng-init="iniciarDistribuidor()"></span>
                <c:import url="menu/menu-distribuidor.jsp"/>
            </c:if>
            <!-- MENU REPRESENTANTE -->
            <c:if test="${usuarioLogado.idFuncao == 2}">
                <span ng-init="iniciarRepresentante()"></span>
                <c:import url="menu/menu-representante.jsp"/>
            </c:if>
        </ul>
    </li>
</ul>

