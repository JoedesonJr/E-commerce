app.controller('vendaController', function ($scope, $http) {

    $scope.selecionarCartao = function () {
        $('.collapsible').addClass("active");
        $('.collapsible').collapsible({accordion: false});
        $('select').material_select();
    };

    $scope.clientes = [];
    $scope.cartoes = [];
    $scope.listaProdutos = [];
    $scope.carrinho = [];
    $scope.total = 0;

    $http.get("getUsuarios?idFuncao=3")
    .success(function (cliente) {
        $scope.clientes = cliente;
    })
    .catch(function (err) {
        console.log('Problema: ' +err);
    })


    $http.get("getEstoque")
    .success(function (produtos) {
        $scope.listaProdutos = produtos;
    }).catch(function (err) {
        console.log('Problema: ' +err);
    });

    $http.get("getCartao")
        .success(function (cartoes) {
            $scope.cartoes = cartoes;
        }).catch(function (err) {
        console.log('Problema: ' +err);
    });

    $scope.adicionarCarrinho = function (produto) {
        $scope.carrinho.push(angular.copy(produto));
        $scope.total = $scope.total + ((produto.preco + produto.st + produto.transporte) * produto.qtd);
        delete $scope.produto;
    };

    $scope.removerProduto = function (produto){
        $scope.total = $scope.total - ((produto.preco + produto.st + produto.transporte) * produto.qtd);
        $scope.carrinho.splice($scope.carrinho.indexOf($scope.produto), 1);
    };

    $scope.cadastrarCartoes = function (cartoes) {

        $http({
            url: 'cadastrarCartoes',
            method: "POST",
            headers: "charset=utf-8",
            data: cartoes
        }).then(function(response) {
            if(response.data.mensagem != null && response.data.status != null) {
                if(response.data.status == 'OK') {
                    Materialize.toast(response.data.mensagem, 5000, 'green lighten-1');
                } else {
                    Materialize.toast(response.data.mensagem, 5000, 'red lighten-1');
                }
            } else {
                Materialize.toast('Cartões não atualizados, tente novamente.', 5000, 'red lighten-1');
            }
        },function(response) {
            console.log("Problema: " +response.data);
            Materialize.toast('Cartões não atualizados, tente novamente.', 5000, 'red lighten-1');
        });
    };
});

