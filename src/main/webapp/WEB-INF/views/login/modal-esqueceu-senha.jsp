<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!-- REMOVER CLIENTE -->
<div id="esqueceu-senha" class="modal grey lighten-5">
    <div class="modal-content">
        <h5 class="thin">
            <i class="material-icons grey-text text-darken-2 small left">vpn_key</i> Recuperar senha
        </h5>
        <p class="blue-text lighten-2">Para recuperar sua senha, precisamos encontrar sua conta. Por favor, informe seu email.</p><br/>
        <!-- FORM -->
        <div class="row">
            <div class="col l1 s1"></div>
            <div class="input-field col l10 s10">
                <i class="material-icons prefix">email</i>
                <input id="email" type="text" name="email" class="validate" ng-model="email" maxlength="50">
                <label for="email">Email</label>
            </div>
            <div class="col l1 s1"></div>
        </div>
    </div>
    <div class="modal-footer">
        <button ng-click="recuperarSenha(email)" class="waves-effect waves-light blue lighten-2 btn left" type="button" style="margin-left: 20px">
            <i class="material-icons right">thumb_up</i> Recuperar
        </button>

        <button class="modal-close btn-floating waves-effect waves-light red lighten-2 right" type="button" style="margin-right: 20px">
            <i class="material-icons right">thumb_down</i>
        </button>
    </div>
    <br/>
</div>