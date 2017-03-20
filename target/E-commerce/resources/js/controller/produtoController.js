app.controller('produtoController', function ($scope, $http, $window) {

    $scope.produtos = [];

    if($scope.produtos.length == 0) {
        $scope.loading = true;

        $http.get("getProdutos")
        .success(function (produtos) {
            $scope.loading = false;
            $scope.produtos = produtos;
        })
        .catch(function (erro) {
            $scope.loading = false;
            Materialize.toast('Houve um problema ao tentar carregar os produtos. Tente novamente.', 5000, 'red lighten-1');
            console.log('Problema: ' +erro);
        });
    }

    $scope.grupos = [];

    if($scope.grupos.length == 0) {
        $http.get("getGrupos")
        .success(function (grupos) {
            $scope.grupos = grupos;
        })
        .catch(function (err) {
            console.log('Problema: ' +err);
        })
    }

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
                    setTimeout(function () {
                        $scope.$apply(function () {
                            $window.location.reload();
                        });
                    }, 3000);
                }
            },function(response) {
                console.log("Problema: " +response.data);
                Materialize.toast('Produto não atualizado, tente novamente.', 5000, 'red lighten-1');
            });
        }
    };

    $scope.removerProduto = function (produto) {

        if(produto != null) {
            $http({
                url: 'removerProduto',
                method: "POST",
                headers: "charset=utf-8",
                data: {idProduto: produto.idProduto}
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
                    setTimeout(function () {
                        $scope.$apply(function () {
                            $window.location.reload();
                        });
                    }, 3000);
                }
            },function(response) {
                console.log("Problema: " +response.data);
                Materialize.toast('Produto não removido, tente novamente.', 5000, 'red lighten-1');
            });
        } else {
            Materialize.toast('Produto não removido, tente novamente.', 5000, 'red lighten-1');
        }
    };

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
                        Materialize.toast(response.data.mensagem, 5000, 'green lighten-1');
                        delete $scope.produto;
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

    function validarFormulario (produto) {
        if(produto == null) {
            Materialize.toast("Preencha o formulário.", 5000, 'red lighten-1');
        } else if(produto.nome == null || produto.nome == "") {
            Materialize.toast("Preencha o campo Nome.", 5000, 'red lighten-1');
        } else if(produto.grupo == null || produto.grupo == "") {
            Materialize.toast("Selecione um Grupo.", 5000, 'red lighten-1');
        } else if(produto.codigo == null || produto.codigo == "") {
            Materialize.toast("Preencha o campo Código.", 5000, 'red lighten-1');
        } else if(produto.medida == null || produto.medida == "") {
            Materialize.toast("Preencha o campo Medida", 5000, 'red lighten-1');
        } else if(produto.descricao == null || produto.descricao == "") {
            Materialize.toast("Preencha o campo Descrição.", 5000, 'red lighten-1');
        } else if(produto.foto == null || produto.foto == "") {
            Materialize.toast("Insira uma foto.", 5000, 'red lighten-1');
        } else if(produto.qtdMinima == null || produto.qtdMinima == "") {
            Materialize.toast("Preencha o campo Quantidade Minima.", 5000, 'red lighten-1');
        } else if(produto.idProduto == 0) {
            Materialize.toast("Produto não alterado, tente novamente.", 5000, 'red lighten-1');
        } else {
            return true;
        }

        return false;
    };

    $scope.limparFormulario = function () {
        delete $scope.produto;
    };

});
