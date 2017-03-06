appLogin.controller("loginController",
    function ($scope, $http, $window) {

    $scope.buscarUsuario = function (usuario) {

        if(usuario != null) {
            $scope.loading = true;
            $http({
                url: 'buscarUsuario',
                method: "POST",
                headers: "charset=utf-8",
                data: $scope.usuario

            }).then(function(response) {
                $scope.loading = false;
                if(response.data.nomeCompleto != null) {
                    $scope.mensagem_ERRO = null;
                    $scope.mensagem_OK = response.data.nomeCompleto;
                } else {
                    $scope.mensagem_ERRO = "Nenhuma conta encontrada";

                    setTimeout(function () {
                        $scope.$apply(function () {
                            $scope.mensagem_ERRO = null;
                        });
                    }, 5000);
                }
            },function(response) {
                $scope.loading = false;
                console.log("Problema: " +response.data1);
            });
        } else {
            $scope.mensagem_ERRO = "Preencha o campo email!";

            setTimeout(function () {
                $scope.$apply(function () {
                    $scope.mensagem_ERRO = null;
                });
            }, 5000);
        }
    };

    $scope.erroLogin = function (nomeUsuario) {
        $scope.mensagem_OK = nomeUsuario;
        $scope.mensagem_ERRO = "Email e/ou senha invalido(s).";

        setTimeout(function () {
            $scope.$apply(function () {
                $scope.mensagem_ERRO = null;
            });
        }, 5000);
    };

    $scope.outraConta = function (usuario) {
        delete $scope.usuario;
        $scope.mensagem_OK = null;
        $scope.mensagem_ERRO = null;
    };

    $scope.recuperarSenha = function (email) {
        if(email != null && email.length > 5) {
            $http({
                url: 'recuperarSenha',
                method: "POST",
                headers: "charset=utf-8",
                data: {email: email}
            }).then(function(response) {
                if(response.data.mensagem != null && response.data.status != null) {
                    if(response.data.status == 'OK') {
                        Materialize.toast(response.data.mensagem, 7000, 'green lighten-1');
                        $('#esqueceu-senha').modal('close');
                    } else {
                        Materialize.toast(response.data.mensagem, 5000, 'red lighten-1');
                    }
                } else {
                    Materialize.toast('Conta não recuperada, tente novamente.', 5000, 'red lighten-1');
                    setTimeout(function () {
                        $scope.$apply(function () {
                            $window.location.reload();
                        });
                    }, 3000);
                }
            },function(response) {
                console.log("Problema: " +response.data);
                Materialize.toast('Conta não recuperada, tente novamente.', 5000, 'red lighten-1');
            });
        } else {
            if(email == null)
                Materialize.toast('Preencha o campo email.', 5000, 'red lighten-1');
            else if(email.length < 5)
                Materialize.toast('Campo email muito curto.', 5000, 'red lighten-1');
        }
    };

    $scope.modalEsqueceuSenha = function () {
        $('.modal').modal();
        $('#esqueceu-senha').modal('open');
    };

    $scope.fecharModalEsqueceuSenha = function () {
        $('#esqueceu-senha').modal('close');
    };

});
