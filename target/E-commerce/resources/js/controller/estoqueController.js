app.controller('estoqueController', function ($scope, $http, $filter) {

    $scope.estoques = [];

    $http.get("getEstoque")
        .success(function (produtos) {
            $scope.estoques = produtos;
        }).catch(function (err) {
        console.log('Problema: ' +err);
    });

    var $input = $('.datepicker').pickadate({
        monthsFull: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
        monthsShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
        weekdaysFull: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sabádo'],
        weekdaysShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab'],
        today: 'Hoje',
        clear: 'Limpar',
        close: 'Pronto',
        labelMonthNext: 'Próximo mês',
        labelMonthPrev: 'Mês anterior',
        labelMonthSelect: 'Selecione um mês',
        labelYearSelect: 'Selecione um ano',
        selectMonths: true,
        selectYears: 15
    });

    var picker = $input.pickadate('picker');

    $scope.modalRegistrarProduto = function (estoque) {
        $scope.estoque = angular.copy(estoque);
        $scope.estoque.validade = $filter('date')($scope.estoque.validade, "d MMMM, yyyy");
        $scope.estoque.index = $scope.estoques.indexOf(estoque);

        if($scope.estoque.validade != null) {
            picker.set($scope.estoque.validade);
        }

        $('.modal').modal();
        $('#registrar-produto').modal('open');
    };

    $scope.registrarProduto = function (produto) {

        if(picker.get() != null) {
            produto.validade = Date.parse(picker.get());
        }

        $http({
            url: 'registrarProduto',
            method: "POST",
            headers: "charset=utf-8",
            data: produto
        }).then(function(response) {

            if(response.data.mensagem != null && response.data.status != null) {
                if(response.data.status == 'OK') {
                    $scope.estoques[$scope.estoque.index] = produto;

                    if(picker.get() != null) {
                        $scope.estoques[$scope.estoque.index].validade = picker.get();
                    }
                    Materialize.toast(response.data.mensagem, 5000, 'green lighten-1');
                } else {
                    Materialize.toast(response.data.mensagem, 5000, 'red lighten-1');
                }
            } else {
                Materialize.toast('Produto não registrado, tente novamente.', 5000, 'red lighten-1');
            }
        },function(response) {
            console.log("Problema: " +response.data);
            Materialize.toast('Produto não registrado, tente novamente.', 5000, 'red lighten-1');
        });
    };

});



