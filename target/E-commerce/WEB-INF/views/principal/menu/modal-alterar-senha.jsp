<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!-- ALTERAR SENHA -->
<div id="alterar-senha" class="modal grey lighten-5">
    <div class="modal-content">
        <h5 class="thin">
            <i class="material-icons grey-text text-darken-2 small left">vpn_key</i> Alterar Senha
        </h5>
        <br/><br/>

        <!-- FORMULARIO -->
        <div class="row">
            <!-- EMAIL -->
            <div class="input-field col l6 m6 s12">
                <i class="material-icons prefix">email</i>
                <input id="email" type="text" name="email" class="validate" ng-model="conta.email" maxlength="50">
                <label for="email">Email</label>
            </div>
            <!-- SENHA ATUAL -->
            <div class="input-field col l6 m6 s12">
                <i class="material-icons prefix">lock_open</i>
                <input id="senhaAtual" type="password" name="senha" ng-model="conta.senha" minlength="6" class="validate" maxlength="8">
                <label class="active" for="senhaAtual">Senha atual</label>
            </div>
        </div>

        <div ng-show="conta.novaSenha && conta.confirmarNovaSenha && conta.novaSenha != conta.confirmarNovaSenha">
            <div id="card-alert-erro" class="card red lighten-5">
                <div class="card-content red-text">
                    <i class="material-icons left">error</i>
                    <p><strong>Opá!</strong> &nbsp; As senhas não correspondem.</p>
                </div>
            </div>
        </div>

        <div class="row">
            <!-- NOVA SENHA -->
            <div class="input-field col l6 m6 s12">
                <i class="material-icons prefix">lock_outline</i>
                <input id="novaSenha" type="password" name="novaSenha" ng-model="conta.novaSenha" class="validate" minlength="6" maxlength="8">
                <label class="active" for="novaSenha">Nova senha</label>
            </div>
            <!-- CONFIRMAR NOVA SENHA -->
            <div class="input-field col l6 m6 s12">
                <i class="material-icons prefix">loop</i>
                <input id="confirmar" type="password" ng-model="conta.confirmarNovaSenha" class="validate" minlength="6" maxlength="8">
                <label class="active" for="confirmar">Confirmar nova senha</label>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <a href="" ng-click="alterarSenha(conta)" ng-disabled="!conta.email || !conta.senha || !conta.novaSenha || !conta.confirmarNovaSenha || conta.novaSenha != conta.confirmarNovaSenha" class="modal-action modal-close waves-effect waves-light blue lighten-2 btn left" style="margin-left: 20px">
            <i class="material-icons right">thumb_up</i> Alterar
        </a>

        <button ng-click="fecharModal()" class="btn-floating waves-effect waves-light red lighten-2 right" type="button" style="margin-right: 20px">
            <i class="material-icons right">thumb_down</i>
        </button>
    </div>
    <br/>
</div>