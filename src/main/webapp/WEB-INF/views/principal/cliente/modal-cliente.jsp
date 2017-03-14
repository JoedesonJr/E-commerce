<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!-- REMOVER CLIENTE -->
<div id="remover-cliente" class="modal grey lighten-5">
    <div class="modal-content">
        <h5 class="thin">
            <i class="material-icons grey-text text-darken-2 small left">delete</i> Remover Cliente
        </h5>
        <p class="red-text text-lighten-2">Tem certeza que deseja remover este cliente?</p>
        <br/>
        <ul class="collection">
            <li class="collection-item grey lighten-4">
                <span class="title thin black-text"> {{us.nomeCompleto}}  / CPF/ CNPJ: {{us.cpf_cnpj}}</span>
                <p>{{us.email}}</p>
            </li>
        </ul>
    </div>
    <div class="modal-footer">
        <a href="" ng-click="removerCliente(us)" class=" modal-action modal-close waves-effect waves-light blue lighten-2 btn left" style="margin-left: 20px">
            <i class="material-icons right">thumb_up</i> Remover
        </a>

        <button ng-click="fecharModalCliente('remover')" class="btn-floating waves-effect waves-light red lighten-2 right" type="button" style="margin-right: 20px">
            <i class="material-icons right">thumb_down</i>
        </button>
    </div>
    <br/>
</div>

<!-- EDITAR CLIENTE -->
<div id="editar-cliente" class="modal grey lighten-5">
    <div class="modal-content">
        <h5 class="thin">
            <i class="material-icons grey-text text-darken-2 small left">mode_edit</i> Editar Cliente
        </h5>
        <br/>
        <!-- FORMULARIO -->
        <div class="row">
            <!-- NOME -->
            <div class="input-field col l8 s12">
                <i class="material-icons prefix">account_circle</i>
                <input id="nome" type="text" name="nomeCompleto" ng-model="us.nomeCompleto" maxlength="50">
                <label class="active" for="nome">Nome Completo</label>
            </div>
            <!-- EMAIL -->
            <div class="input-field col l4 s12">
                <i class="material-icons prefix">email</i>
                <input id="email" type="text" name="email" ng-model="us.email" maxlength="50">
                <label class="active" for="email">Email</label>
            </div>
        </div>
        <div class="row">
            <!-- CPF / CNPJ -->
            <div class="input-field col l4 m6 s12">
                <i class="material-icons prefix">dialpad</i>
                <input id="cpf" type="text" name="cpf_cnpj" ng-model="us.cpf_cnpj" ui-br-cpfcnpj-mask>
                <label class="active" for="cpf">CPF ou CNPJ</label>
            </div>
            <!-- TELEFONE 1 -->
            <div class="input-field col l4 m6 s12">
                <i class="material-icons prefix">call</i>
                <input id="telefone1" type="text" name="telefone1" ng-model="us.telefone[0].telefone" ui-br-phone-number>
                <label class="active" for="telefone1">Telefone 1</label>
            </div>
            <!-- TELEFONE 2 -->
            <div class="input-field col l4 m6 s12">
                <i class="material-icons prefix">call</i>
                <input id="telefone2" type="text" name="telefone2" ng-model="us.telefone[1].telefone" ui-br-phone-number>
                <label class="active" for="telefone2">Telefone 2</label>
            </div>
        </div>
        <div class="row">
            <!-- ENDEREÇO -->
            <div class="input-field col l8 s12">
                <i class="material-icons prefix">location_on</i>
                <input id="endereco" type="text" name="endereco" ng-model="us.endereco" maxlength="100">
                <label class="active" for="endereco">Endereço</label>
            </div>
            <!-- CEP -->
            <div class="input-field col l4 s12">
                <i class="material-icons prefix">location_on</i>
                <input id="cep" type="text" name="cep" ng-model="us.cep" ui-br-cep-mask>
                <label class="active" for="cep">CEP</label>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <a href="" ng-click="editarCliente(us)" class=" modal-action modal-close waves-effect waves-light blue lighten-2 btn left" style="margin-left: 20px">
            <i class="material-icons right">thumb_up</i> Editar
        </a>

        <button class="modal-close btn-floating waves-effect waves-light red lighten-2 right" type="button" style="margin-right: 20px">
            <i class="material-icons right">thumb_down</i>
        </button>
    </div>
    <br/>
</div>