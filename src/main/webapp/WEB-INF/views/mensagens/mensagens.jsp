<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<div ng-show="mensagem_OK">
    <div id="card-alert-ok" class="card green lighten-5">
        <div class="card-content green-text">
            <i class="material-icons left">done</i>
            <p><strong>Ok!</strong> &nbsp; {{mensagem_OK}}</p>
        </div>
    </div>
</div>

<div ng-show="mensagem_ERRO">
    <div id="card-alert-erro" class="card red lighten-5">
        <div class="card-content red-text">
            <i class="material-icons left">error</i>
            <p><strong>Opá!</strong> &nbsp; {{mensagem_ERRO}}</p>
        </div>
    </div>
</div>




