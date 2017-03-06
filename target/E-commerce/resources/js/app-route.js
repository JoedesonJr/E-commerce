var app = angular.module('principal', ['ngRoute', 'ui.utils.masks']);

app.config(['$routeProvider', function ($routeProvider) {

    $routeProvider
        // PRODUTO
        .when('/cadastro/produto', {
            templateUrl: 'cadastro/produto',
            controller: 'produtoController'
        })
        .when('/visualizar/produtos', {
            templateUrl: 'visualizar/produtos',
            controller: 'produtoController'
        })

        // CLIENTE
        .when('/cadastro/cliente', {
            templateUrl: 'cadastro/cliente',
            controller: 'clienteController'
        })
        .when('/visualizar/clientes', {
            templateUrl: 'visualizar/clientes',
            controller: 'clienteController'
        })

        // REPRESENTANTE
        .when('/cadastro/representante', {
            templateUrl: 'cadastro/representante',
            controller: 'representanteController'
        })
        .when('/visualizar/representantes', {
            templateUrl: 'visualizar/representantes',
            controller: 'representanteController'
        })

        // GRUPO
        .when('/cadastro/grupo', {
            templateUrl: 'cadastro/grupo',
            controller: 'grupoController'
        })
        .when('/visualizar/grupos', {
            templateUrl: 'visualizar/grupos',
            controller: 'grupoController'
        })

        // VENDA
        .when('/visualizar/vendas', {
            templateUrl: 'visualizar/vendas',
            controller: 'principalController'
        })

        // ESTOQUE
        .when('/cadastro/estoque', {
            templateUrl: 'cadastro/estoque',
            controller: 'estoqueController'
        })
        .when('/visualizar/estoque', {
            templateUrl: 'visualizar/estoque',
            controller: 'estoqueController'
        })

        .otherwise({redirectTo: '/cadastro/produto'});
}]);
