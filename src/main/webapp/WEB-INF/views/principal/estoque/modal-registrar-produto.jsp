<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!-- ALTERAR SENHA -->
<div id="registrar-produto" class="modal grey lighten-5">
    <div class="modal-content">
        <h5 class="thin">
            ;<i class="material-icons grey-text text-darken-2 small left">store</i> Registrar Produto
        </h5>
        <br/><br/>

        validade: {{estoque.validade}}

        <!-- FORMULARIO -->
        <div class="row">
            <!-- PRODUTO -->
            <div class="input-field col l7 m7 s7">
                <i class="material-icons prefix">redeem</i>
                <input id="produto" type="text" name="produto" class="validate" ng-model="estoque.produto.nome" maxlength="50" disabled>
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
                <input id="preco" type="text" name="preco" ng-model="estoque.preco" class="validate">
                <label class="active" for="preco">Preço</label>
            </div>
            <!-- ST -->
            <div class="input-field col l4 m4 s12">
                <i class="material-icons prefix">gavel</i>
                <input id="st" type="text" name="st" ng-model="estoque.st" class="validate">
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
            <div class="input-field col l6 m4 s12">
                <i class="material-icons prefix">add_circle_outline</i>
                <input id="quantidade" type="text" name="quantidade" class="validate" ng-model="estoque.quantidade" maxlength="50">
                <label class="active" for="quantidade">Quantidade em Estoque</label>
            </div>
            <!-- QUANTIDADE MINIMA -->
            <div class="input-field col l6 m4 s12">
                <i class="material-icons prefix">remove_circle_outline</i>
                <input id="quantidade-minima" type="text" name="quantidadeMinima" class="validate" ng-model="estoque.qtdMinima" maxlength="50">
                <label class="active" for="quantidade-minima">Quantidade Minima</label>
            </div>
        </div>

    </div>
    <div class="modal-footer">
        <a href="" ng-click="registrarProduto(estoque)" class="modal-action modal-close waves-effect waves-light blue lighten-2 btn left" style="margin-left: 20px">
            <i class="material-icons right">thumb_up</i> Confirmar
        </a>

        <button class="btn-floating waves-effect waves-light red lighten-2 right modal-close" type="button" style="margin-right: 20px">
            <i class="material-icons right">thumb_down</i>
        </button>
    </div>
    <br/>
</div>