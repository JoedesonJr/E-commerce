<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!-- ALTERAR SENHA -->
<div id="editar-produto" class="modal grey lighten-5">
    <div class="modal-content">
        <h5 class="thin">
            <i class="material-icons grey-text text-darken-2 small left">store</i> Registrar Produto
        </h5>
        <br/><br/>

        <!-- FORMULARIO -->
        <div class="row">
            <!-- PRODUTO -->
            <div class="input-field col l7 m7 s7">
                <i class="material-icons prefix">redeem</i>
                <input id="produto" type="text" name="produto" class="validate blue-text" ng-model="estoque.produto.nome" maxlength="50" disabled>
                <label class="active" for="produto">Produto</label>
            </div>
            <!-- LOTE -->
            <div class="input-field col l5 m5 s5">
                <i class="material-icons prefix">view_module</i>
                <input id="lote" type="text" name="lote" class="validate" ng-model="estoque.lote" maxlength="50">
                <label class="active" for="lote">Lote</label>
            </div>
        </div>
        <div class="row">
            <!-- PRECO -->
            <div class="input-field col l4 m4 s12">
                <i class="material-icons prefix">attach_money</i>
                <input id="preco" type="text" name="preco" ng-model="estoque.preco" class="validate" ui-money-mask="2">
                <label class="active" for="preco">Preço</label>
            </div>
            <!-- ST -->
            <div class="input-field col l4 m4 s12">
                <i class="material-icons prefix">gavel</i>
                <input id="st" type="text" name="st" ng-model="estoque.st" class="validate" ui-money-mask="2">
                <label class="active" for="st">ST</label>
            </div>
            <!-- VALIDADE -->
            <div class="input-field col l4 m4 s12">
                <i class="material-icons prefix">today</i>
                <input id="validade" type="text" name="validade" ng-model="estoque.validade" class="datepicker">
                <label class="active" for="validade">Validade</label>
            </div>
        </div>
        <div class="row">
            <!-- QUANTIDADE -->
            <div class="input-field col l4 m4 s12">
                <i class="material-icons prefix">add_circle_outline</i>
                <input id="quantidade" type="text" name="quantidade" class="validate" ng-model="estoque.quantidade" maxlength="50" ui-number-mask="0" ui-hide-group-sep>
                <label class="active" for="quantidade">Quantidade em Estoque</label>
            </div>
            <!-- TRANSPORTE -->
            <div class="input-field col l4 m4 s12">
                <i class="material-icons prefix">local_shipping</i>
                <input id="transporte" type="text" name="transporte" ng-model="estoque.transporte" class="validate" ui-money-mask="2">
                <label class="active" for="st">Transporte</label>
            </div>
            <div class="col l1 m1"></div>
            <!-- DISPONIVEL -->
            <div class="switch col l3 m3 s12">
                <label>Disponível</label><br/><br/>
                <label>
                    Não
                    <input type="checkbox" ng-model="estoque.disponivel">
                    <span class="lever"></span>
                    Sim
                </label>
            </div>
        </div>

    </div>
    <div class="modal-footer">
        <a href="" ng-click="editarProduto(estoque)" class="modal-action modal-close waves-effect waves-light blue lighten-2 btn left" style="margin-left: 20px">
            <i class="material-icons right">thumb_up</i> Confirmar
        </a>

        <button class="btn-floating waves-effect waves-light red lighten-2 right modal-close" type="button" style="margin-right: 20px">
            <i class="material-icons right">thumb_down</i>
        </button>
    </div>
    <br/>
</div>
