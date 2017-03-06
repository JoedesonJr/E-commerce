<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form action="autenticarUsuario" method="post" autocomplete="off">
    <input type="hidden" name="nomeCompleto" value="{{mensagem_OK}}">

    <div class="row">
        <div class="col l12 s12">

            <!-- ERRO LOGIN -->
            <c:if test="${not empty ERRO}">
                <div ng-init="erroLogin('${ERRO.nomeCompleto}')"></div>
                <div ng-init="usuario.email='${ERRO.email}'"></div>
            </c:if>

            <!-- MENSAGEM -->
            <div style="margin-bottom: 30px">
                <c:import url="../mensagens/mensagens.jsp"/>
            </div>

            <!-- USUARIO NAO ENCONTRADO -->
            <div ng-show="!mensagem_OK">
                <!-- EMAIL -->
                <div class="input-field">
                    <input id="email" type="text" name="email" ng-model="usuario.email" class="validate" ng-maxlength="30">
                    <label for="email">Insira seu e-mail</label>
                </div>
                <button type="button" ng-click="buscarUsuario(usuario)" class="btn waves-effect waves-light col s12 blue darken-2">Seguir</button>
            </div>

            <!-- USUARIO ENCONTRADO -->
            <div ng-if="mensagem_OK">
                <!-- SENHA -->
                <div class="input-field">
                    <input id="senha" type="password" name="senha" class="validate" minlength="6" maxlength="10" required>
                    <label for="senha">Insira sua senha</label>
                </div>
                <br/>
                <button type="submit" class="btn waves-effect waves-light col s12 blue darken-2">
                    Acessar sua conta
                </button> &nbsp;&nbsp;&nbsp;
                <button type="button" ng-click="outraConta(usuario)" class="btn waves-effect waves-light col s12 green lighten-2">
                    Login com outra conta
                </button>
            </div>

            <div class="progress" ng-if="loading">
                <br/><br/>
                <div class="indeterminate"></div>
            </div>

        </div>
    </div>
</form>