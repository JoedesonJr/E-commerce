<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!-- REMOVER PRODUTO -->
<div id="remover-produto" class="modal grey lighten-5">
    <div class="modal-content">
        <h5 class="thin">
            <i class="material-icons grey-text text-darken-2 small left">delete</i> Remover Produto
        </h5>
        <p class="red-text text-lighten-2">Tem certeza que deseja remover este produto?</p>
        <br/>
        <ul class="collection">
            <li class="collection-item avatar grey lighten-4">
                <img ng-src="{{prod.foto}}" alt="{{prod.nome}}" class="circle responsive-img">
                <span class="title thin black-text">{{prod.nome}}</span>
                <p>{{prod.grupo}}</p>
            </li>
        </ul>
    </div>
    <div class="modal-footer">
        <a href="" ng-click="removerProduto(prod)" class=" modal-action modal-close waves-effect waves-light blue lighten-2 btn left" style="margin-left: 20px">
            <i class="material-icons right">thumb_up</i> Remover
        </a>

        <button ng-click="fecharModalProduto('remover')" class="btn-floating waves-effect waves-light red lighten-2 right" type="button" style="margin-right: 20px">
            <i class="material-icons right">thumb_down</i>
        </button>
    </div>
    <br/>
</div>

<!-- EDITAR PRODUTO -->
<div id="editar-produto" class="modal grey lighten-5">
    <div class="modal-content">
        <h5 class="thin">
            <i class="material-icons grey-text text-darken-2 small left">mode_edit</i> Editar Produto
        </h5>
        <br/>
        <!-- FORMULARIO -->
        <div class="row">
            <div class="col l12 m12 s12">
                <!-- IMAGEM -->
                <div class="center">
                    <img ng-if="!prod.foto" class="responsive-img" src="https://image.flaticon.com/icons/png/512/283/283915.png">
                    <img ng-if="prod.foto" class="responsive-img" ng-src="{{prod.foto}}" />
                </div>
                <br/><br/>
                <!-- URL -->
                <div class="input-field">
                    <i class="material-icons prefix">language</i>
                    <input id="url" type="text" name="foto" ng-model="prod.foto" class="validate">
                    <label class="active" for="url">URL</label>
                </div>
            </div>
            <br/>
            <!-- GRUPO -->
            <div class="row">
                <div class="col l1 m1">
                    <br/>
                    <i class="material-icons hide-on-small-only">dashboard</i>
                </div>
                <div class="col l11 m11 s12 input-field">
                    <select ng-model="prod.grupo" class="browser-default" ng-options="grupo.grupo for grupo in grupos">
                        <option value="" disabled selected> {{prod.grupo}} </option>
                    </select>
                </div>
            </div>
            <!-- NOME -->
            <div class="row">
                <div class="col l12 m12 s12 input-field">
                    <i class="material-icons prefix">mode_edit</i>
                    <input id="nome" type="text" name="nome" ng-model="prod.nome" maxlength="50">
                    <label class="active" for="nome">Nome</label>
                </div>
            </div>
            <div class="row">
                <!-- CODIGO -->
                <div class="input-field col s4">
                    <i class="material-icons prefix">dialpad</i>
                    <input id="codigo" type="text" name="codigo" ng-model="prod.codigo" maxlength="7" ui-number-mask="0" ui-hide-group-sep>
                    <label class="active" for="codigo">Código</label>
                </div>
                <!-- MEDIDA -->
                <div class="input-field col s4">
                    <i class="material-icons prefix">settings_ethernet</i>
                    <input id="medida" type="text" name="medida" ng-model="prod.medida" maxlength="30">
                    <label class="active" for="medida">Medida</label>
                </div>
                <!-- QUANT. MINIMA -->
                <div class="input-field col s4">
                    <i class="material-icons prefix">add_circle_outline</i>
                    <input id="quantidade" type="text" ng-model="prod.qtdMinima" maxlength="7" ui-number-mask="0" ui-hide-group-sep>
                    <label class="active" for="quantidade">Q. Minima</label>
                </div>
            </div>
            <!-- DESCRICAO -->
            <div class="row">
                <div class="input-field col l12 m12 s12">
                    <i class="material-icons prefix">message</i>
                    <textarea id="descricao" name="descricao" ng-model="prod.descricao" class="materialize-textarea"></textarea>
                    <label class="active" for="descricao">Descrição</label>
                </div>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <a href="" ng-click="editarProduto(prod)" class="modal-action modal-close waves-effect waves-light blue lighten-2 btn left" style="margin-left: 20px">
            <i class="material-icons right">thumb_up</i> Editar
        </a>

        <button class="modal-close btn-floating waves-effect waves-light red lighten-2 right" type="button" style="margin-right: 20px">
            <i class="material-icons right">thumb_down</i>
        </button>
    </div>
    <br/>
</div>


