app.controller('principalController', function ($scope, $http, $location, $window) {

    $scope.iniciarDistribuidor = function () {
        //$location.path("/visualizar/vendas")
    };
    $scope.iniciarRepresentante = function () {
        //$location.path("/cadastro/cliente");
    };

    $scope.modalAlterarSenha = function () {
        $('.modal').modal();
        $('#alterar-senha').modal('open');
    };

    $scope.fecharModal = function () {
        $('#alterar-senha').modal('close');
    };

    $scope.alterarSenha = function (usuario) {
        $http({
            url: 'alterarSenha',
            method: "POST",
            headers: "charset=utf-8",
            data: usuario
        }).then(function(response) {
            if(response.data.mensagem != null && response.data.status != null) {
                if(response.data.status == 'OK') {
                    Materialize.toast(response.data.mensagem, 5000, 'green lighten-1');

                    setTimeout(function () {
                        $scope.$apply(function () {
                            $window.location.reload();
                        });
                    }, 3000);
                } else {
                    Materialize.toast(response.data.mensagem, 5000, 'red lighten-1');
                }
            } else {
                Materialize.toast("Senha não alterada, tente novamente.", 5000, 'red lighten-1');
            }
        },function(response) {
            console.log("Problema: " +response.data);
            Materialize.toast("Senha não alterada, tente novamente.", 5000, 'red lighten-1');
        });

        delete $scope.conta;
    };
});

