<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!-- ALTERAR SENHA -->
<div id="registrar-produto" class="modal grey lighten-5">
    <div class="modal-content">
        <h5 class="thin">
            <i class="material-icons grey-text text-darken-2 small left">store</i> Registrar Produto
        </h5>
        <br/><br/>

        <!-- FORMULARIO -->
        <div class="row">
            <!-- PRODUTO -->
            <div class="input-field col l6 m6 s6">
                <div class="row">
                    <div class="col l1 m1">
                        <br/>
                        <i class="material-icons hide-on-small-only">redeem</i>
                    </div>
                    <div class="col l11 m11 s12 input-field">
                        <select  ng-model="registrar.produto" class="browser-default" ng-options="produto.codigo +' - '+ produto.nome for produto in produtos">
                            <option value="" disabled selected>  ---  Selecione um Produto  ---  </option>
                        </select>
                    </div>
                </div>
            </div>
            <!-- LOTE -->
            <div class="input-field col l3 m3 s3">
                <i class="material-icons prefix">view_module</i>
                <input id="lote" type="text" name="lote" class="validate" ng-model="registrar.lote" maxlength="50">
                <label for="lote">Lote</label>
            </div>
            <!-- DISPONIVEL -->
            <div class="switch col l3 m3 s3">
                <label class="active">Disponível</label><br/><br/>
                <label>
                    Não
                    <input type="checkbox" ng-model="registrar.disponivel">
                    <span class="lever"></span>
                    Sim
                </label>
            </div>
        </div>
        <div class="row">
            <!-- PRECO -->
            <div class="input-field col l4 m4 s12">
                <i class="material-icons prefix">attach_money</i>
                <input id="preco" type="text" name="preco" ng-model="registrar.preco" class="validate" ui-money-mask="2">
                <label for="preco">Preço</label>
            </div>
            <!-- ST -->
            <div class="input-field col l4 m4 s12">
                <i class="material-icons prefix">gavel</i>
                <input id="st" type="text" name="st" ng-model="registrar.st" class="validate" ui-money-mask="2">
                <label for="st">ST</label>
            </div>

            Validade: {{registrar.validade}}

            <!-- VALIDADE -->
            <div class="input-field col l4 m4 s12">
                <i class="material-icons prefix">today</i>
                <input id="valid" type="text" name="valid" ng-model="registrar.validade" class="datepicker">
                <label for="valid">Validade</label>
            </div>
        </div>
        <div class="row">
            <!-- QUANTIDADE -->
            <div class="input-field col l4 m4 s12">
                <i class="material-icons prefix">add_circle_outline</i>
                <input id="quantidade" type="text" name="quantidade" class="validate" ng-model="registrar.quantidade" maxlength="50" ui-number-mask="0" ui-hide-group-sep>
                <label for="quantidade">Quantidade em Estoque</label>
            </div>
            <!-- QUANTIDADE MINIMA -->
            <div class="input-field col l4 m4 s12">
                <i class="material-icons prefix">remove_circle_outline</i>
                <input class="black-text" type="text" name="quantidadeMinima" ng-model="registrar.produto.qtdMinima" maxlength="50" ui-number-mask="0" ui-hide-group-sep disabled>
                <label class="active grey-text">Quantidade Minima</label>
            </div>
            <!-- TRANSPORTE -->
            <div class="input-field col l4 m4 s12">
                <i class="material-icons prefix">local_shipping</i>
                <input id="transporte" type="text" name="transporte" ng-model="registrar.transporte" class="validate" ui-money-mask="2">
                <label for="st">Transporte</label>
            </div>
        </div>

    </div>
    <div class="modal-footer">
        <a ng-click="registrarProduto(registrar)" class="modal-action modal-close waves-effect waves-light blue lighten-2 btn left" style="margin-left: 20px">
            <i class="material-icons right">thumb_up</i> Confirmar
        </a>

        <button class="btn-floating waves-effect waves-light red lighten-2 right modal-close" type="button" style="margin-right: 20px">
            <i class="material-icons right">thumb_down</i>
        </button>
    </div>
    <br/>
</div>
