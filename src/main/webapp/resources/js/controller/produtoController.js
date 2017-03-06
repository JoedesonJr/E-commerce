app.controller('produtoController', function ($scope, $http, $rootScope) {

    $scope.produtos = [];

    $http.get("getProdutos")
        .success(function (produtos) {
            $scope.produtos = produtos;
        })
        .catch(function (err) {
            console.log('Problema: ' +err);
        });

    $scope.modalProduto = function (produto, acao) {
        $scope.prod = angular.copy(produto);
        $scope.produto = produto;

        if(acao == 'remover') {
            $('.modal').modal();
            $('#remover-produto').modal('open');
        } else if(acao == 'editar') {
            $('.modal').modal();
            $('#editar-produto').modal('open');
        }
    }

    $scope.fecharModalProduto = function (acao) {
        $scope.prod = [];
        $scope.produto = [];

        if(acao == 'remover') {
            $('#remover-produto').modal('close');
        } else if(acao == 'editar') {
            $('#editar-produto').modal('close');
        }
    }

    $scope.editarProduto = function (produto) {

        if(validarFormulario(produto)) {

            if(produto.grupo.idGrupo == null) {
                produto.idGrupo = $scope.produto.idGrupo;
                produto.grupo = $scope.produto.grupo;
            } else {
                produto.idGrupo = produto.grupo.idGrupo;
                produto.grupo = produto.grupo.grupo;
            }

            $http({
                url: 'atualizarProduto',
                method: "POST",
                headers: "charset=utf-8",
                data: produto
            }).then(function(response) {

                if(response.data.mensagem != null && response.data.status != null) {
                    if(response.data.status == 'OK') {
                        Materialize.toast(response.data.mensagem, 5000, 'green lighten-1');

                        // ATUALIZAR OBJETO DA LISTA
                        $scope.produto.foto =  produto.foto;
                        $scope.produto.idGrupo = produto.idGrupo;
                        $scope.produto.grupo = produto.grupo;
                        $scope.produto.nome = produto.nome;
                        $scope.produto.codigo = produto.codigo;
                        $scope.produto.medida = produto.medida;
                        $scope.produto.descricao = produto.descricao;

                    } else {
                        Materialize.toast(response.data.mensagem, 5000, 'red lighten-1');
                    }
                } else {
                    Materialize.toast('Produto não atualizado, tente novamente.', 5000, 'red lighten-1');
                }
            },function(response) {
                console.log("Problema: " +response.data);
                Materialize.toast('Produto não atualizado, tente novamente.', 5000, 'red lighten-1');
            });
        }
    };

    $scope.removerProduto = function (produto) {

        if(produto != null) {

            var produt = {
                idProduto: produto.idProduto
            };

            $http({
                url: 'removerProduto',
                method: "POST",
                headers: "charset=utf-8",
                data: produt
            }).then(function(response) {

                if(response.data.mensagem != null && response.data.status != null) {
                    if(response.data.status == 'OK') {
                        Materialize.toast('Produto removido com sucesso', 5000, 'green lighten-1');

                        // REMOVER OBJETO DA LISTA
                        $scope.produtos.splice($scope.produtos.indexOf($scope.produto), 1);

                    } else {
                        Materialize.toast('Produto não removido, tente novamente.', 5000, 'red lighten-1');
                    }
                } else {
                    Materialize.toast('Produto não removido, tente novamente.', 5000, 'red lighten-1');
                }
            },function(response) {
                console.log("Problema: " +response.data);
                Materialize.toast('Produto não removido, tente novamente.', 5000, 'red lighten-1');
            });
        } else {
            Materialize.toast('Produto não removido, tente novamente.', 5000, 'red lighten-1');
        }
    };
    
    $scope.grupos = [];

    $http.get("getGrupos")
        .success(function (grupos) {
            $scope.grupos = grupos;
        })
        .catch(function (err) {
            console.log('Problema: ' +err);
        })

    $scope.cadastrarProduto = function (produto) {

        if(validarFormulario(produto)) {

            produto.idGrupo = produto.grupo.idGrupo;
            produto.grupo = produto.grupo.grupo;

            $http({
                url: 'cadastrarProduto',
                method: "POST",
                headers: "charset=utf-8",
                data: produto

            }).then(function(response) {

                if(response.data.mensagem != null && response.data.status != null) {
                    if(response.data.status == 'OK') {
                        //$scope.mensagem_OK = response.data.mensagem;
                        Materialize.toast(response.data.mensagem, 5000, 'green lighten-1');
                        delete $scope.produto;
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

    function validarFormulario (produto) {

        if(produto == null) {
            //$scope.mensagem_ERRO = "Preencha o formulário.";
            Materialize.toast("Preencha o formulário.", 5000, 'red lighten-1');
        } else if(produto.nome == null || produto.nome == "") {
            //$scope.mensagem_ERRO = "Preencha o campo Nome.";
            Materialize.toast("Preencha o campo Nome.", 5000, 'red lighten-1');
        } else if(produto.grupo == null || produto.grupo == "") {
            //$scope.mensagem_ERRO = "Selecione um Grupo.";
            Materialize.toast("Selecione um Grupo.", 5000, 'red lighten-1');
        } else if(produto.codigo == null || produto.codigo == "") {
            //$scope.mensagem_ERRO = "Preencha o campo Código.";
            Materialize.toast("Preencha o campo Código.", 5000, 'red lighten-1');
        } else if(produto.medida == null || produto.medida == "") {
            //$scope.mensagem_ERRO = "Preencha o campo Medida";
            Materialize.toast("Preencha o campo Medida", 5000, 'red lighten-1');
        } else if(produto.descricao == null || produto.descricao == "") {
            //$scope.mensagem_ERRO = "Preencha o campo Descrição.";
            Materialize.toast("Preencha o campo Descrição.", 5000, 'red lighten-1');
        } else if(produto.foto == null || produto.foto == "") {
            //$scope.mensagem_ERRO = "Insira uma foto.";
            Materialize.toast("Insira uma foto.", 5000, 'red lighten-1');
        } else if(produto.idProduto == 0) {
            Materialize.toast("Produto não alterado, tente novamente.", 5000, 'red lighten-1');
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
        delete $scope.produto;
    };

});
