<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- CAMINHO -->
<nav>
    <div class="nav-wrapper blue lighten-2">
        <div class="col s12">
            <a href="#" class="breadcrumb"></a>
            <a href="#" class="breadcrumb">Produto</a>
            <a href="#" class="breadcrumb">Cadastrar Produto</a>
        </div>
    </div>
</nav>

<!-- CADASTRAR PRODUTO -->
<div class="row">
    <!-- FOTO -->
    <div class="card grey lighten-5 col l6 m6 s12" style="margin-top: 2%; height: 700px">
        <div class="card-content">
            <div class="card-title center">Insira uma foto deste produto.</div>
            <img ng-if="!produto.foto" class="responsive-img" src="https://image.flaticon.com/icons/png/512/283/283915.png">
            <img ng-if="produto.foto" class="responsive-img" ng-src="{{produto.foto}}" />
            <br/><br/>
            <div class="row">
                <div class="input-field col s12">
                    <i class="material-icons prefix">language</i>
                    <input id="url" type="text" name="foto" ng-model="produto.foto">
                    <label for="url">URL</label>
                </div>
            </div>
        </div>
    </div>
    <!-- PRODUTO -->
    <div class="card grey lighten-5 col l6 m6 s12" style="margin-top: 2%; height: 700px">
        <div class="card-content">
            <i class="material-icons medium left grey-text text-darken-3 hide-on-small-only">redeem</i>
            <h4 class="thin grey-text text-darken-3">
                Novo Produto
            </h4>
            <br ng-if="!mensagem_OK && !mensagem_ERRO"/>

            <!-- MENSAGEM -->
            <div style="margin-bottom: 20px; margin-top: 10px;">
                <c:import url="../../mensagens/mensagens.jsp"/>
            </div>
            <br ng-if="!mensagem_OK && !mensagem_ERRO"/>

            <!-- GRUPO -->
            <div class="row">
                <div class="col l1 m1">
                    <br/>
                    <i class="material-icons hide-on-small-only">dashboard</i>
                </div>
                <div class="col l11 m11 s12 input-field">
                    <select  ng-model="produto.grupo" class="browser-default" ng-options="grupo.grupo for grupo in grupos">
                        <option value="" disabled selected>  ---  Selecione um Grupo  ---  </option>
                    </select>
                </div>
            </div>
            <!-- NOME -->
            <div class="row">
                <div class="col l12 m12 s12 input-field">
                    <i class="material-icons prefix">mode_edit</i>
                    <input id="nome" type="text" name="nome" ng-model="produto.nome" maxlength="50">
                    <label for="nome">Nome</label>
                </div>
            </div>
            <div class="row">
                <!-- CODIGO -->
                <div class="input-field col s4">
                    <i class="material-icons prefix">dialpad</i>
                    <input id="codigo" type="text" name="codigo" ng-model="produto.codigo" maxlength="7" ui-number-mask="0" ui-hide-group-sep>
                    <label for="codigo">Código</label>
                </div>
                <!-- MEDIDA -->
                <div class="input-field col s4">
                    <i class="material-icons prefix">settings_ethernet</i>
                    <input id="medida" type="text" name="medida" ng-model="produto.medida" maxlength="30">
                    <label for="medida">Medida</label>
                </div>
                <!-- QUANT. MINIMA -->
                <div class="input-field col s4">
                    <i class="material-icons prefix">add_circle_outline</i>
                    <input id="quantidade" type="text" ng-model="produto.qtdMinima" maxlength="7" ui-number-mask="0" ui-hide-group-sep>
                    <label for="quantidade">Q. Minima</label>
                </div>
            </div>
            <!-- DESCRICAO -->
            <div class="row">
                <div class="input-field col l12 m12 s12">
                    <i class="material-icons prefix">message</i>
                    <textarea id="descricao" name="descricao" ng-model="produto.descricao" class="materialize-textarea"></textarea>
                    <label for="descricao">Descrição</label>
                </div>
            </div>
            <br/>
            <div class="card-action">
                <div class="row">
                    <div class="col l6 m6 s6 left">
                        <button ng-click="cadastrarProduto(produto)" class="btn waves-effect waves-light blue lighten-2 left" type="button">
                            Cadastrar <i class="material-icons right">send</i>
                        </button>
                    </div>
                    <div class="col l6 m6 s6 right">
                        <button ng-click="limparFormulario()" class="btn-floating waves-effect waves-light green lighten-2 right" type="button">
                            <i class="material-icons right">replay</i>
                        </button>
                    </div>
                </div>
            </div>
        </div> <!-- ./card-content -->
    </div> <!-- ./card -->
</div>

