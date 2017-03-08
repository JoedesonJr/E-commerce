app.controller('vendaController', function ($scope, $http) {

    $scope.clientes = [];
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

    $scope.adicionarCarrinho = function (produto) {
        $scope.carrinho.push(angular.copy(produto));
        $scope.total = $scope.total + (produto.preco * produto.qtd);
        delete $scope.produto;
    };

    $scope.removerProduto = function (produto){
        $scope.total = $scope.total - (produto.preco * produto.qtd);
        $scope.carrinho.splice($scope.carrinho.indexOf($scope.produto), 1);
    };

});

