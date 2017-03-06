app.controller('grupoController', function ($scope, $http) {

    $scope.grupos = [];

    $http.get("getGrupos")
        .success(function (grupos) {
            $scope.grupos = grupos;
        })
        .catch(function (err) {
            console.log('Problema: ' +err);
        })

    $scope.modalGrupo = function (grupo, acao) {
        if(grupo.idGrupo == 1) {
            Materialize.toast('Este grupo não pode ser editado.', 5000, 'red lighten-1');
        } else {
            $scope.grup = angular.copy(grupo);
            $scope.grupoLista = grupo;

            if (acao == 'remover') {
                $('.modal').modal();
                $('#remover-grupo').modal('open');
            } else if (acao == 'editar') {
                $('.modal').modal();
                $('#editar-grupo').modal('open');
            }
        }
    }

    $scope.fecharModalGrupo = function (acao) {
        $scope.grup = [];

        if(acao == 'remover') {
            $('#remover-grupo').modal('close');
        } else if(acao == 'editar') {
            $('#editar-grupo').modal('close');
        }
    }

    $scope.editarGrupo = function (grupo) {

        if(validarFormulario(grupo)) {

            $http({
                url: 'atualizarGrupo',
                method: "POST",
                headers: "charset=utf-8",
                data: grupo
            }).then(function(response) {

                if(response.data.mensagem != null && response.data.status != null) {
                    if(response.data.status == 'OK') {
                        Materialize.toast(response.data.mensagem, 5000, 'green lighten-1');

                        // ATUALIZAR OBJETO DA LISTA
                        $scope.grupoLista.grupo = grupo.grupo;

                    } else {
                        Materialize.toast(response.data.mensagem, 5000, 'red lighten-1');
                    }
                } else {
                    Materialize.toast('Grupo não atualizado, tente novamente.', 5000, 'red lighten-1');
                }
            },function(response) {
                console.log("Problema: " +response.data);
                Materialize.toast('Grupo não atualizado, tente novamente.', 5000, 'red lighten-1');
            });
        }
    };

    $scope.removerGrupo = function (grupo) {

        if(grupo != null) {
            if(grupo.idGrupo == 1) {
                Materialize.toast('Este grupo não pode ser removido.', 5000, 'red lighten-1');
            } else if(grupo.idGrupo > 1) {
                var produt = {
                    idGrupo: grupo.idGrupo
                };

                $http({
                    url: 'removerGrupo',
                    method: "POST",
                    headers: "charset=utf-8",
                    data: produt
                }).then(function(response) {

                    if(response.data.mensagem != null && response.data.status != null) {
                        if(response.data.status == 'OK') {
                            Materialize.toast('Grupo removido com sucesso', 5000, 'green lighten-1');

                            // REMOVER OBJETO DA LISTA
                            $scope.grupos.splice($scope.grupos.indexOf($scope.grupoLista), 1);

                        } else {
                            Materialize.toast('Grupo não removido, tente novamente.', 5000, 'red lighten-1');
                        }
                    } else {
                        Materialize.toast('Grupo não removido, tente novamente.', 5000, 'red lighten-1');
                    }
                },function(response) {
                    console.log("Problema: " +response.data);
                    Materialize.toast('Grupo não removido, tente novamente.', 5000, 'red lighten-1');
                });
            }
        } else {
            Materialize.toast('Grupo não removido, tente novamente.', 5000, 'red lighten-1');
        }
    }

    $scope.cadastrarGrupo = function (grupo) {

        if(validarFormulario(grupo)) {

            $http({
                url: 'cadastrarGrupo',
                method: "POST",
                headers: "charset=utf-8",
                data: grupo

            }).then(function(response) {

                if(response.data.mensagem != null && response.data.status != null) {
                    if(response.data.status == 'OK') {
                        //$scope.mensagem_OK = response.data.mensagem;
                        Materialize.toast(response.data.mensagem, 5000, 'green lighten-1');
                        delete $scope.grupo;
                    } else {
                        //$scope.mensagem_ERRO = response.data.mensagem;
                        Materialize.toast(response.data.mensagem, 5000, 'red lighten-1');
                    }
                } else {
                    //$scope.mensagem_ERRO = "Cadastro não efetuado, tente novamente.";
                    Materialize.toast("Cadastro não efetuado, tente novamente.", 5000, 'red lighten-1');
                }
            },function(response) {
                console.log("Problema: " +response.data);
                //$scope.mensagem_ERRO = "Cadastro não efetuado, tente novamente.";
                Materialize.toast("Cadastro não efetuado, tente novamente.", 5000, 'red lighten-1');
            });
            /*
            setTimeout(function () {
                $scope.$apply(function () {
                    $scope.mensagem_ERRO = null;
                    $scope.mensagem_OK = null;
                });
            }, 5000);
            */
        }
    };

    function validarFormulario (grupo) {

        if(grupo == null) {
            //$scope.mensagem_ERRO = "Preencha o formulário.";
            Materialize.toast("Preencha o formulário.", 5000, 'red lighten-1');
        } else if(grupo.grupo == null || grupo.grupo == "") {
            //$scope.mensagem_ERRO = "Preencha o campo Grupo.";
            //$scope.mensagem_ERRO = "Preencha o formulário.";
            Materialize.toast("Preencha o formulário.", 5000, 'red lighten-1');
        } else {
            //delete $scope.mensagem_ERRO;
            return true;
        }
        /*
        setTimeout(function () {
            $scope.$apply(function () {
                $scope.mensagem_ERRO = null;
            });
        }, 5000);
        */
        return false;
    };

    $scope.limparFormulario = function () {
        delete $scope.grupo;
    };
});
