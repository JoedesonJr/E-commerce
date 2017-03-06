app.controller('representanteController', function ($scope, $http) {

    $scope.usuarios = [];

    $http.get("getUsuarios?idFuncao=2")
        .success(function (usuarios) {
            $scope.usuarios = usuarios;
        })
        .catch(function (err) {
            console.log('Problema: ' +err);
        })

    $scope.modalRepresentante = function (representante, acao) {
        $scope.us = angular.copy(representante);
        $scope.usuario = representante;

        if(acao == 'remover') {
            $('.modal').modal();
            $('#remover-representante').modal('open');
        } else if(acao == 'editar') {
            $('.modal').modal();
            $('#editar-representante').modal('open');
        }
    }

    $scope.fecharModalRepresentante = function (acao) {
        $scope.us = [];

        if(acao == 'remover') {
            $('#remover-representante').modal('close');
        } else if(acao == 'editar') {
            $('#editar-representante').modal('close');
        }
    };

    $scope.editarRepresentante = function (representante) {
        if(validarFormulario(representante)) {

            if (representante.idUsuario > 0) {

                var end = representante.endereco;
                representante.endereco = representante.endereco +' - CEP: '+ representante.cep;

                $http({
                    url: 'atualizarUsuario',
                    method: "POST",
                    headers: "charset=utf-8",
                    data: representante
                }).then(function(response) {

                    if(response.data.mensagem != null && response.data.status != null) {
                        if(response.data.status == 'OK') {
                            Materialize.toast('Representante atualizado com sucesso', 5000, 'green lighten-1');

                            // ATUALIZAR OBJETO DA LISTA
                            $scope.usuario.nomeCompleto = representante.nomeCompleto;
                            $scope.usuario.email = representante.email;
                            $scope.usuario.cpf_cnpj = representante.cpf_cnpj;
                            $scope.usuario.endereco = end;
                            $scope.usuario.cep = representante.cep;
                            $scope.usuario.telefone = representante.telefone;

                        } else {
                            Materialize.toast('Já possui um usuário com este Email e/ou CPF/CNPJ.', 5000, 'red lighten-1');
                        }
                    } else {
                        Materialize.toast('Representante não atualizado, tente novamente.', 5000, 'red lighten-1');
                    }
                },function(response) {
                    console.log("Problema: " +response.data);
                    Materialize.toast('Representante não atualizado, tente novamente.', 5000, 'red lighten-1');
                });
            } else {
                Materialize.toast('Representante não atualizado, tente novamente.', 5000, 'red lighten-1');
            }
        }
    };

    $scope.removerRepresentante = function (representante) {

        if(representante != null) {

            var represent = {
                idUsuario: representante.idUsuario
            };

            $http({
                url: 'removerUsuario',
                method: "POST",
                headers: "charset=utf-8",
                data: represent
            }).then(function(response) {

                if(response.data.mensagem != null && response.data.status != null) {
                    if(response.data.status == 'OK') {
                        Materialize.toast('Representante removido com sucesso', 5000, 'green lighten-1');

                        // REMOVER OBJETO DA LISTA
                        $scope.usuarios.splice($scope.usuarios.indexOf($scope.usuario), 1);

                    } else {
                        Materialize.toast('Representante não removido, tente novamente.', 5000, 'red lighten-1');
                    }
                } else {
                    Materialize.toast('Representante não removido, tente novamente.', 5000, 'red lighten-1');
                }
            },function(response) {
                console.log("Problema: " +response.data);
                Materialize.toast('Representante não removido, tente novamente.', 5000, 'red lighten-1');
            });
        } else {
            Materialize.toast('Representante não removido, tente novamente.', 5000, 'red lighten-1');
        }
    };

    $scope.cadastrarRepresentante = function (usuario) {

        if(validarFormulario(usuario)) {

            var user = {
                nomeCompleto: usuario.nomeCompleto,
                email: usuario.email,
                endereco: usuario.endereco +" - CEP: "+ usuario.cep,
                cpf_cnpj: usuario.cpf_cnpj,
                telefone: [ {telefone: usuario.telefone1}, {telefone: usuario.telefone2} ],
                idFuncao: 2
            };

            $http({
                url: 'cadastrarUsuario',
                method: "POST",
                headers: "charset=utf-8",
                data: user

            }).then(function(response) {

                if(response.data.mensagem != null && response.data.status != null) {
                    if(response.data.status == 'OK') {
                        //$scope.mensagem_OK = response.data.mensagem;
                        Materialize.toast(response.data.mensagem, 5000, 'green lighten-1');
                        delete $scope.usuario;
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

    function validarFormulario (usuario) {

        if (usuario == null) {
            //$scope.mensagem_ERRO = "Preencha o formulário.";
            Materialize.toast("Preencha o formulário.", 5000, 'red lighten-1');
        } else if (usuario.nomeCompleto == null || usuario.nomeCompleto == "") {
            //$scope.mensagem_ERRO = "Preencha o campo Nome Completo.";
            Materialize.toast("Preencha o campo Nome Completo.", 5000, 'red lighten-1');
        } else if (usuario.email == null || usuario.email == "") {
            //$scope.mensagem_ERRO = "Preencha o campo Email.";
            Materialize.toast("Preencha o campo Email.", 5000, 'red lighten-1');
        } else if (usuario.cpf_cnpj == null || usuario.cpf_cnpj == "") {
            //$scope.mensagem_ERRO = "Preencha o campo CPF ou CNPJ.";
            Materialize.toast("CPF ou CNPJ invalido.", 5000, 'red lighten-1');
        } else if (usuario.idUsuario == null && usuario.telefone1 == null && usuario.telefone2 == null) {
            //$scope.mensagem_ERRO = "Preencha algum dos campos Telefone.";
            Materialize.toast("Preencha algum dos campos Telefone.", 5000, 'red lighten-1');
        } else if (usuario.endereco == null || usuario.endereco == "") {
            //$scope.mensagem_ERRO = "Preencha o campo Endereco.";
            Materialize.toast("Preencha o campo Endereco.", 5000, 'red lighten-1');
        } else if (usuario.cep == null || usuario.cep == "") {
            //$scope.mensagem_ERRO = "Preencha o campo CEP.";
            Materialize.toast("Preencha o campo CEP.", 5000, 'red lighten-1');
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
        delete $scope.usuario;
    };

});

