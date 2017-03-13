<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- CAMINHO -->
<nav>
    <div class="nav-wrapper blue lighten-2">
        <div class="col s12">
            <a href="#" class="breadcrumb"></a>
            <a href="#" class="breadcrumb">Grupo</a>
            <a href="#" class="breadcrumb">Cadastrar Grupo</a>
        </div>
    </div>
</nav>

<!-- CADASTRAR GRUPO -->
<div class="card grey lighten-5" style="margin-top: 2%">
    <div class="card-content">
        <!-- TITULO -->
        <i class="material-icons medium left grey-text text-darken-3 hide-on-small-only">dashboard</i>
        <h4 class="thin grey-text text-darken-3">
            Novo Grupo
        </h4>
        <br/>

        <!-- MENSAGEM -->
        <div style="margin-bottom: 20px">
            <c:import url="../../mensagens/mensagens.jsp"/>
        </div>
        <br/>

        <!-- FORMULARIO -->
        <div class="row">
            <!-- GRUPO -->
            <div class="input-field col l12 s12">
                <i class="material-icons prefix">mode_edit</i>
                <input id="nome" type="text" name="grupo" ng-model="grupo.grupo" maxlength="100">
                <label for="nome">Grupo</label>
            </div>
        </div>
        <br/><br/>
        <div class="card-action">
            <div class="row">
                <div class="col l6 m6 s6">
                    <button ng-click="cadastrarGrupo(grupo)" class="btn waves-effect waves-light blue lighten-2 leftn" type="button">Cadastrar
                        <i class="material-icons right">send</i>
                    </button>
                </div>
                <div class="col l6 m6 s6">
                    <button ng-click="limparFormulario()" class="btn-floating tooltip waves-effect waves-light green lighten-2 right" data-position="top" data-delay="50" data-tooltip="Limpar formulário" type="button">
                        <i class="material-icons right">replay</i>
                    </button>
                </div>
            </div>
        </div>
    </div> <!-- ./card-content -->
</div> <!-- ./card -->
