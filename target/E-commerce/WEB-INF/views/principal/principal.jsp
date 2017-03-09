<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Principal</title>

        <!-- FONTS -->
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- MATERIALIZE -->
        <link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/materialize.min.css'/>"  media="screen,projection"/>
        <link type="text/css" rel="stylesheet" href="<c:url value='/resources/css/style.min.css'/>" />
        <!-- ANGULAR -->
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular-route.js"></script>
        <script src="<c:url value='/resources/js/angular-locale_pt-br.js'/>"></script>
        <script src="<c:url value='/resources/js/app-route.js?r=<%=session.getId()%>'/>"></script>
        <script src="<c:url value='/resources/angular/angular-input-masks-standalone.js'/>"></script>

        <!-- RODAPE -->
        <style>
            body {
                display: flex;
                min-height: 100vh;
                flex-direction: column;
            }

            main {
                flex: 1 0 auto;
            }
        </style>
    </head>
    <body ng-app="principal" ng-controller="principalController" ng-cloak>
        <c:if test="${usuarioLogado.idFuncao == 1}">
            <div></div>
        </c:if>

        <!-- MENU -->
        <c:import url="menu/menu.jsp"/>

        <!-- CONTEÚDO -->
        <main>
            <div ng-view></div>
        </main>

        <!-- RODAPE -->
        <c:import url="rodape.jsp"/>

        <!-- MODAL ALTERAR SENHA -->
        <c:import url="menu/modal-alterar-senha.jsp"/>

        <script src="<c:url value='/resources/js/controller/produtoController.js?r=<%=session.getId()%>'/>"></script>
        <script src="<c:url value='/resources/js/controller/representanteController.js?r=<%=session.getId()%>'/>"></script>
        <script src="<c:url value='/resources/js/controller/grupoController.js?r=<%=session.getId()%>'/>"></script>
        <script src="<c:url value='/resources/js/controller/clienteController.js?r=<%=session.getId()%>'/>"></script>
        <script src="<c:url value='/resources/js/controller/principalController.js?r=<%=session.getId()%>'/>"></script>
        <script src="<c:url value='/resources/js/controller/estoqueController.js?r=<%=session.getId()%>'/>"></script>
        <script src="<c:url value='/resources/js/controller/vendaController.js?r=<%=session.getId()%>'/>"></script>

        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="<c:url value='/resources/js/materialize.min.js'/>"></script>

        <script type="text/javascript">
            $(document).ready(function(){
                $(".button-collapse").sideNav();
                $('.collapsible').collapsible();
                $('.datepicker').pickadate({
                    selectMonths: true, // Creates a dropdown to control month
                    selectYears: 15 // Creates a dropdown of 15 years to control year
                });
            });
        </script>
    </body>
</html>
