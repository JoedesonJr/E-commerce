app.controller('clienteController', function ($scope, $http, $window) {

    $scope.usuarios = [];

    if($scope.usuarios.length == 0) {
        $scope.loading = true;

        $http.get("getUsuarios?idFuncao=3")
        .success(function (usuarios) {
            $scope.loading = false;
            $scope.usuarios = usuarios;
        })
        .catch(function (err) {
            $scope.loading = false;
            console.log('Problema: ' +err);
        })
    }

    $scope.modalCliente = function (cliente, acao) {
        $scope.us = angular.copy(cliente);
        $scope.usuario = cliente;

        if(acao == 'remover') {
            $('.modal').modal();
            $('#remover-cliente').modal('open');
        } else if (acao == 'editar') {
            $('.modal').modal();
            $('#editar-cliente').modal('open');
        }
    }

    $scope.editarCliente = function (cliente) {
        if(validarFormulario(cliente)) {

            if (cliente.idUsuario > 0) {
                var end = cliente.endereco;
                cliente.endereco = cliente.endereco +' - CEP: '+ cliente.cep;

                $http({
                    url: 'atualizarUsuario',
                    method: "POST",
                    headers: "charset=utf-8",
                    data: cliente
                }).then(function(response) {
                    if(response.data.mensagem != null && response.data.status != null) {
                        if(response.data.status == 'OK') {
                            Materialize.toast('Cliente atualizado com sucesso', 5000, 'green lighten-1');

                            // ATUALIZAR OBJETO DA LISTA
                            $scope.usuario.nomeCompleto = cliente.nomeCompleto;
                            $scope.usuario.email = cliente.email;
                            $scope.usuario.cpf_cnpj = cliente.cpf_cnpj;
                            $scope.usuario.endereco = end;
                            $scope.usuario.cep = cliente.cep;
                            $scope.usuario.telefone = cliente.telefone;

                        } else {
                            Materialize.toast('Já possui um usuário com este Email e/ou CPF/CNPJ.', 5000, 'red lighten-1');
                        }
                    } else {
                        Materialize.toast('Cliente não atualizado, tente novamente.', 5000, 'red lighten-1');
                        setTimeout(function () {
                            $scope.$apply(function () {
                                $window.location.reload();
                            });
                        }, 3000);
                    }
                },function(response) {
                    console.log("Problema: " +response.data);
                    Materialize.toast('Cliente não atualizado, tente novamente.', 5000, 'red lighten-1');
                });
            } else {
                Materialize.toast('Cliente não atualizado, tente novamente.', 5000, 'red lighten-1');
            }
        }
    };
    
    $scope.removerCliente = function (cliente) {
        if(cliente != null && cliente.idUsuario > 0) {
            $http({
                url: 'removerUsuario',
                method: "POST",
                headers: "charset=utf-8",
                data: cliente
            }).then(function(response) {
                if(response.data.mensagem != null && response.data.status != null) {
                    if(response.data.status == 'OK') {
                        Materialize.toast('Cliente removido com sucesso', 5000, 'green lighten-1');

                        // REMOVER OBJETO DA LISTA
                        $scope.usuarios.splice($scope.usuarios.indexOf($scope.usuario), 1);
                    } else {
                        Materialize.toast('Cliente não removido, tente novamente.', 5000, 'red lighten-1');
                    }
                } else {
                    Materialize.toast('Cliente não removido, tente novamente.', 5000, 'red lighten-1');
                    setTimeout(function () {
                        $scope.$apply(function () {
                            $window.location.reload();
                        });
                    }, 3000);
                }
            },function(response) {
                console.log("Problema: " +response.data);
                Materialize.toast('Cliente não removido, tente novamente.', 5000, 'red lighten-1');
            });
        } else {
            Materialize.toast('Cliente não removido, tente novamente.', 5000, 'red lighten-1');
        }
    };

    $scope.cadastrarCliente = function (usuario) {

        if(validarFormulario(usuario)) {
            var user = {
                nomeCompleto: usuario.nomeCompleto,
                email: usuario.email,
                endereco: usuario.endereco +" - CEP: "+ usuario.cep,
                cpf_cnpj: usuario.cpf_cnpj,
                telefone: [ {telefone: usuario.telefone1}, {telefone: usuario.telefone2} ],
                idFuncao: 3,
                idUsuario: usuario.idUsuario
            };

            $http({
                url: 'cadastrarUsuario',
                method: "POST",
                headers: "charset=utf-8",
                data: user
            }).then(function(response) {
                if(response.data.mensagem != null && response.data.status != null) {
                    if(response.data.status == 'OK') {
                        Materialize.toast(response.data.mensagem, 5000, 'green lighten-1');
                        delete $scope.usuario;
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

    function validarFormulario (usuario) {

        if (usuario == null) {
            Materialize.toast("Preencha o formulário.", 5000, 'red lighten-1');
        } else if (usuario.nomeCompleto == null || usuario.nomeCompleto == "") {
            Materialize.toast("Preencha o campo Nome Completo.", 5000, 'red lighten-1');
        } else if (usuario.email == null || usuario.email == "") {
            Materialize.toast("Preencha o campo Email.", 5000, 'red lighten-1');
        } else if (usuario.cpf_cnpj == null || usuario.cpf_cnpj == "") {
            Materialize.toast("CPF ou CNPJ invalido.", 5000, 'red lighten-1');
        } else if (usuario.idUsuario == null && usuario.telefone1 == null && usuario.telefone2 == null) {
            Materialize.toast("Preencha algum dos campos Telefone.", 5000, 'red lighten-1');
        } else if (usuario.endereco == null || usuario.endereco == "") {
            Materialize.toast("Preencha o campo Endereco.", 5000, 'red lighten-1');
        } else if (usuario.cep == null || usuario.cep == "") {
            Materialize.toast("Preencha o campo CEP.", 5000, 'red lighten-1');
        } else {
            return true;
        }

        return false;
    };

    $scope.limparFormulario = function () {
        delete $scope.usuario;
    };

});


