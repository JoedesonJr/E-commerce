<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html ng-app="ecommerce">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Login</title>

        <!-- FONTS -->
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- MATERIALIZE -->
        <link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/materialize.min.css'/>"  media="screen,projection"/>
        <!-- ANGULAR -->
        <script src="<c:url value='/resources/angular/angular.js'/>"></script>
        <script src="<c:url value='/resources/js/angular-locale_pt-br.js'/>"></script>
        <script src="<c:url value='/resources/js/app.js'/>"></script>
        <script src="<c:url value='/resources/js/controller/loginController.js?r=<%=session.getId()%>'/>"></script>
        <script src="<c:url value='/resources/angular/angular-input-masks-standalone.min.js'/>"></script>
    </head>
    <body ng-controller="loginController" ng-cloak>
        <br/><br/><br/>

        <div class="row">
            <div class="col offset-l4 l4 offset-l4 s12 offset-m2 m8 offset-m2">
                <div class="card grey lighten-5">
                    <div class="card-content">
                        <!-- TITULO -->
                        <h2 class="thin grey-text text-darken-3">
                            Login <i class="material-icons right medium blue-text text-lighten-4">lock_open</i>
                        </h2>
                        <p class="blue-text text-darken-2">Identifique-se para acessar sua conta.</p>
                        <br/>

                        <!-- FORMULARIO -->
                        <c:import url="form-login.jsp"/>
                    </div>
                    <br/>
                    <div class="card-action center-align">
                        <!-- MODAL -->
                        <a class="blue-text text-lighten-1" ng-click="modalEsqueceuSenha()" href="">Esqueceu sua senha?</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- MODAL ESQUECEU SENHA -->
        <c:import url="modal-esqueceu-senha.jsp"/>

        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/materialize.min.js'/>"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $('input').keypress(function (e) {
                    var code = null;
                    code = (e.keyCode ? e.keyCode : e.which);
                    return (code == 13) ? false : true;
                });
            });
        </script>
    </body>
</html>