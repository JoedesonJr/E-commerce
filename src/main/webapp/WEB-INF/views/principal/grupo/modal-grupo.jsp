<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!-- REMOVER GRUPO -->
<div id="remover-grupo" class="modal grey lighten-5">
    <div class="modal-content">
        <h5 class="thin">
            <i class="material-icons grey-text text-darken-2 small left">delete</i> Remover Grupo
        </h5>
        <p class="red-text text-lighten-2">Tem certeza que deseja remover este grupo?</p>
        <br/>
        <ul class="collection">
            <li class="collection-item grey lighten-4">
                <div>{{grup.grupo}}</div>
            </li>
        </ul>
    </div>
    <div class="modal-footer">
        <a href="" ng-click="removerGrupo(grup)" class=" modal-action modal-close waves-effect waves-light blue lighten-2 btn left" style="margin-left: 20px">
            <i class="material-icons right">thumb_up</i> Remover
        </a>

        <button ng-click="fecharModalGrupo('remover')" class="btn-floating waves-effect waves-light red lighten-2 right" type="button" style="margin-right: 20px">
            <i class="material-icons right">thumb_down</i>
        </button>
    </div>
    <br/>
</div>

<!-- EDITAR GRUPO -->
<div id="editar-grupo" class="modal grey lighten-5">
    <div class="modal-content">
        <h5 class="thin">
            <i class="material-icons grey-text text-darken-2 small left">mode_edit</i> Editar Grupo
        </h5>
        <br/><br/>
        <!-- FORMULARIO -->
        <div class="row">
            <!-- GRUPO -->
            <div class="input-field col l12 s12">
                <input id="nome" type="text" name="grupo" ng-model="grup.grupo" class="validate" maxlength="50">
                <label class="active" for="nome">Grupo</label>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <a href="" ng-click="editarGrupo(grup)" class=" modal-action modal-close waves-effect waves-light blue lighten-2 btn left" style="margin-left: 20px">
            <i class="material-icons right">thumb_up</i> Editar
        </a>

        <button ng-click="fecharModalGrupo('editar')" class="btn-floating waves-effect waves-light red lighten-2 right" type="button" style="margin-right: 20px">
            <i class="material-icons right">thumb_down</i>
        </button>
    </div>
    <br/>
</div>