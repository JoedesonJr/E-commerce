app.controller('grupoController', function ($scope, $http, $window) {

    $scope.grupos = [];

    if($scope.grupos.length == 0) {
        $scope.loading = true;

        $http.get("getGrupos")
        .success(function (grupos) {
            $scope.loading = false;
            $scope.grupos = grupos;
        })
        .catch(function (err) {
            $scope.loading = false;
            Materialize.toast('Houve um problema ao tentar carregar os grupos. Tente novamente.', 5000, 'red lighten-1');
            console.log('Problema: ' +err);
        })
    }

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
                    setTimeout(function () {
                        $scope.$apply(function () {
                            $window.location.reload();
                        });
                    }, 3000);
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

                $http({
                    url: 'removerGrupo',
                    method: "POST",
                    headers: "charset=utf-8",
                    data: {idGrupo: grupo.idGrupo}
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
                        setTimeout(function () {
                            $scope.$apply(function () {
                                $window.location.reload();
                            });
                        }, 3000);
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
                        Materialize.toast(response.data.mensagem, 5000, 'green lighten-1');
                        delete $scope.grupo;
                    } else {
                        Materialize.toast(response.data.mensagem, 5000, 'red lighten-1');
                    }
                } else {
                    Materialize.toast("Cadastro não efetuado, tente novamente.", 5000, 'red lighten-1');
                    setTimeout(function () {
                        $scope.$apply(function () {
                            $window.location.reload();
                        });
                    }, 3000);
                }
            },function(response) {
                console.log("Problema: " +response.data);
                Materialize.toast("Cadastro não efetuado, tente novamente.", 5000, 'red lighten-1');
            });
        }
    };

    function validarFormulario (grupo) {
        if(grupo == null) {
            Materialize.toast("Preencha o formulário.", 5000, 'red lighten-1');
        } else if(grupo.grupo == null || grupo.grupo == "") {
            Materialize.toast("Preencha o formulário.", 5000, 'red lighten-1');
        } else {
            return true;
        }

        return false;
    };

    $scope.limparFormulario = function () {
        delete $scope.grupo;
    };
});
