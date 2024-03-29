<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- CAMINHO -->
<nav>
    <div class="nav-wrapper blue lighten-2">
        <div class="col s12">
            <a href="#" class="breadcrumb"></a>
            <a href="#" class="breadcrumb">Realizar Venda</a>
        </div>
    </div>
</nav>

<!-- CADASTRAR GRUPO -->
<div class="card grey lighten-5" style="margin-top: 2%">
    <div class="card-content">
        <!-- TITULO -->
        <i class="material-icons medium left grey-text text-darken-3">shopping_cart</i>
        <h4 class="thin grey-text text-darken-3">
            Realizar Venda
        </h4>
        <br/>

        <!-- CLIENTE -->
        <div class="card grey lighten-5" style="margin-top: 1%">
            <div class="card-content">
                <!-- TITULO -->
                <h5 class="thin grey-text text-darken-2" style="font-weight: 300;">
                    <i class="material-icons small left grey-text text-darken-3">perm_identity</i> Cliente
                </h5>

                <div class="row">
                    <div ng-class="{'col l5': venda.cliente, 'col l8': !venda.cliente}">
                        <div class="input-field">
                            <select  ng-model="venda.cliente" class="browser-default blue-text" ng-options="cliente.nomeCompleto for cliente in clientes">
                                <option value="" selected>  ---  Selecione um Cliente  ---  </option>
                            </select>
                        </div>
                    </div>
                    <!-- EMAIL -->
                    <div ng-if="venda.cliente" class="col l4">
                        <div class="input-field">
                            <i class="material-icons prefix">email</i>
                            <input id="email" type="text" ng-model="venda.cliente.email" class="blue-text" disabled>
                            <label class="active black-text" for="email">Email</label>
                        </div>
                    </div>
                    <!-- CPF / CNPJ -->
                    <div ng-if="venda.cliente" class="col l3">
                        <div class="input-field">
                            <i class="material-icons prefix">dialpad</i>
                            <input id="cpf" type="text" ng-model="venda.cliente.cpf_cnpj" class="blue-text" ui-br-cpfcnpj-mask disabled>
                            <label class="active black-text" for="cpf">CPF ou CNPJ</label>
                        </div>
                    </div>
                    <!-- ADICIONAR CLIENTE -->
                    <div class="col l4 center-align">
                        <a ng-if="!venda.cliente.cpf_cnpj" class="waves-effect waves-light btn-flat blue-text" style="margin-top: 18px">
                            <i class="material-icons left">add</i>Adicionar Cliente
                        </a>
                    </div>
                </div>

                <div ng-if="venda.cliente" class="row">
                    <!-- ENDERECO -->
                    <div class="input-field col l8 s12">
                        <i class="material-icons prefix">location_on</i>
                        <input id="endereco" type="text" ng-model="venda.cliente.endereco" class="blue-text" disabled>
                        <label class="active black-text" for="endereco">Endereço</label>
                    </div>
                    <!-- TELEFONE 1 -->
                    <div ng-if="venda.cliente.telefone[0].telefone" class="input-field col l4 s12">
                        <i class="material-icons prefix">call</i>
                        <input id="telefone1" type="text" ng-model="venda.cliente.telefone[0].telefone" class="blue-text" ui-br-phone-number disabled>
                        <label class="active black-text" for="telefone1">Telefone</label>
                    </div>
                    <!-- TELEFONE 2 -->
                    <div ng-if="!venda.cliente.telefone[0].telefone" class="input-field col l4 s12">
                        <i class="material-icons prefix">call</i>
                        <input id="telefone2" type="text" ng-model="venda.cliente.telefone[1].telefone" class="blue-text" ui-br-phone-number disabled>
                        <label class="active black-text" for="telefone1">Telefone</label>
                    </div>
                </div>

            </div> <!-- ./card-content -->
        </div> <!-- ./card -->

        <!-- PRODUTO -->
        <div class="card grey lighten-5" style="margin-top: 2%">
            <div class="card-content">
                <!-- TITULO -->
                <h5 class="thin grey-text text-darken-2" style="font-weight: 300;">
                    <i class="material-icons small left grey-text text-darken-3">redeem</i> Produtos
                </h5>

                <div class="row">
                    <!-- PRODUTO -->
                    <div ng-class="{'col l6': produto, 'col l12': !produto}">
                        <div class="input-field">
                            <select  ng-model="produto" class="browser-default blue-text" ng-options="p.produto.nome for p in listaProdutos">
                                <option value="" selected>  ---  Selecione um Produto  ---  </option>
                            </select>
                        </div>
                    </div>
                    <!-- MEDIDA -->
                    <div ng-if="produto" class="col l3 input-field">
                        <i class="material-icons prefix">settings_ethernet</i>
                        <input id="medida" type="text" name="medida" ng-model="produto.produto.medida" class="blue-text" disabled>
                        <label class="active black-text" for="medida">Medida</label>
                    </div>
                    <!-- CÓDIGO -->
                    <div ng-if="produto" class="col l3 input-field">
                        <i class="material-icons prefix">dialpad</i>
                        <input id="codigo" type="text" name="codigo" ng-model="produto.produto.codigo" class="blue-text" disabled>
                        <label class="active black-text" for="codigo">Código</label>
                    </div>
                </div>

                <!-- PRECO/ QTD/ TOTAL -->
                <div ng-if="produto" class="row">
                    <!-- PRECO -->
                    <div class="col l4 input-field">
                        <i class="material-icons prefix">attach_money</i>
                        <input id="preco" type="text" ng-model="produto.preco" class="blue-text" ui-money-mask="2" disabled>
                        <label class="active black-text" for="preco">Preço</label>
                    </div>
                    <!-- QUANTIDADE -->
                    <div class="col l4 input-field">
                        <i class="material-icons prefix">add_circle_outline</i>
                        <input id="quantidade" type="text" class="blue-text" ng-model="produto.qtd" maxlength="7" ui-number-mask="0" ui-hide-group-sep>
                        <label class="active black-text" for="quantidade">Quantidade</label>
                    </div>
                    <!-- VALOR TOTAL -->
                    <div class="col l4 input-field">
                        <i class="material-icons prefix">attach_money</i>
                        <input id="total" type="text" ng-model="produto.total" ng-value="(produto.preco + produto.st + produto.transporte) * produto.qtd | currency" class="blue-text" disabled>
                        <label class="active black-text" for="total">Valor Total</label>
                    </div>
                </div>

                <div ng-if="produto" class="card-action">
                    <!-- PRODUTO AUSENTE -->
                    <div ng-if="produto.preco == 0 || produto.quantidade == 0">
                        <div class="card red lighten-5">
                            <div class="card-content red-text">
                                <i class="material-icons left">error</i>
                                <p><strong>Opá!</strong>&nbsp; Este produto está em falta ou ainda não foi registrado no estoque.</p>
                            </div>
                        </div>
                    </div>
                    <!-- PRODUTO EM FALTA -->
                    <div ng-if="produto.quantidade > 0 && produto.qtd > produto.quantidade">
                        <div class="card red lighten-5">
                            <div class="card-content red-text">
                                <i class="material-icons left">error</i>
                                <p>
                                    <strong>Opá!</strong>&nbsp; Não temos está quantidade requerida.
                                    <strong class="right">Quantidade em estoque: {{produto.quantidade}}</strong>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div ng-if="produto.preco > 0 && produto.qtd > 0 && produto.qtd <= produto.quantidade">
                        <button ng-click="adicionarCarrinho(produto)" class="btn waves-effect waves-light blue lighten-2 left" type="button">Adicionar ao Carrinho
                            <i class="material-icons right">send</i>
                        </button>
                        <br/>
                    </div>
                </div>
            </div> <!-- ./card-content -->
        </div> <!-- ./card -->

        <!-- TOTAL -->
        <div ng-if="total > 0" class="card grey lighten-5" style="margin-top: 2%">
            <div class="card-content">

                <!-- ITENS -->
                <ul ng-if="carrinho" class="collection">
                    <li class="collection-item dismissable" ng-repeat="item in carrinho">
                        <div>
                            <a ng-click="removerProduto(item)" href="" class="secondary-content"><i class="material-icons red-text text-lighten-1">delete</i></a>
                            <span class="secondary-content grey-text">
                                {{(item.preco + item.st + item.transporte) * item.qtd | currency}} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </span>
                        </div>
                        <div class="collection-header blue-text">
                            {{item.qtd}}x &nbsp; {{item.produto.nome}}
                        </div>
                    </li>
                </ul>

                <br/> <!-- TOTAL -->
                <h5 class="thin grey-text text-darken-2" style="font-weight: 300;">
                    <i class="material-icons small left grey-text text-darken-3">attach_money</i>
                    Total da Venda:&nbsp; <span class="green-text">{{total | currency}}</span>
                    <span class="right">
                        <p>
                            <input name="pagamento" type="radio" ng-model="venda.pagamento" value="dinheiro" id="dinheiro" />
                            <label for="dinheiro">Dinheiro</label> &nbsp;

                            <input name="pagamento" type="radio" ng-model="venda.pagamento" value="cartao" id="cartao" />
                            <label for="cartao">Cartão de Crédito</label>
                        </p>
                    </span>
                </h5><br/>

                <div ng-if="venda.pagamento == 'cartao'">
                    <ul class="collapsible" data-collapsible="accordion">
                        <li ng-click="selecionarCartao()" ng-repeat="cartao in cartoes">

                            <div class="collapsible-header" ng-if="cartao.aceito">
                                <i class="material-icons">credit_card</i> {{cartao.bandeira}}
                            </div>
                            <div class="collapsible-body grey lighten-4" ng-if="cartao.aceito">

                                <div class="row">
                                    <div class="col l6 input-field">
                                        <i class="material-icons prefix">dialpad</i>
                                        <input id="numero" type="text" >
                                        <label class="blue-text" for="numero">Número do Cartão</label>
                                    </div>
                                    <div class="col l6">
                                        <div class="row">
                                            <div class="col l6 input-field">
                                                <i class="material-icons prefix">event</i>
                                                <input id="mes" type="text" >
                                                <label for="mes">Mês</label>
                                            </div>
                                            <div class="col l6 input-field">
                                                <i class="material-icons prefix">date_range</i>
                                                <input id="ano" type="text" >
                                                <label class="blue-text" for="ano">Ano</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col l8 input-field">
                                        <i class="material-icons prefix">assignment_ind</i>
                                        <input id="nome" type="text" >
                                        <label class="blue-text" for="nome">Nome e Sobrenome impresso no Cartão</label>
                                    </div>
                                    <div class="col l4 input-field">
                                        <i class="material-icons prefix">dialpad</i>
                                        <input id="cpff" type="text" ng-model="lll" ui-br-cpfcnpj-mask>
                                        <label class="blue-text" for="cpff">CPF do Titular</label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col l4 input-field">
                                        <i class="material-icons prefix">lock_outline</i>
                                        <input id="seg" type="text" >
                                        <label class="blue-text" for="seg">Código de Segurança</label>
                                    </div>
                                    <div class="input-field col s8">
                                        <select>
                                            <optgroup label="Juros de 4,05%">
                                                <option value="1">1x &nbsp;de&nbsp; {{total | currency}}</option>
                                            </optgroup>
                                            <optgroup label="Juros de 6,99%">
                                                <option value="2">2x &nbsp;de&nbsp; {{((total + (total * 0.0699))/2) | currency}}</option>
                                                <option value="2">3x &nbsp;de&nbsp; {{((total + (total * 0.0699))/3) | currency}}</option>
                                                <option value="2">4x &nbsp;de&nbsp; {{((total + (total * 0.0699))/4) | currency}}</option>
                                                <option value="2">5x &nbsp;de&nbsp; {{((total + (total * 0.0699))/5) | currency}}</option>
                                                <option value="2">6x &nbsp;de&nbsp; {{((total + (total * 0.0699))/6) | currency}}</option>
                                            </optgroup>
                                            <optgroup label="Juros de 7,99%">
                                                <option value="2">7x &nbsp;de&nbsp; {{((total + (total * 0.0799))/7) | currency}}</option>
                                                <option value="2">8x &nbsp;de&nbsp; {{((total + (total * 0.0799))/8) | currency}}</option>
                                                <option value="2">9x &nbsp;de&nbsp; {{((total + (total * 0.0799))/9) | currency}}</option>
                                                <option value="2">10x &nbsp;de&nbsp; {{((total + (total * 0.0799))/10) | currency}}</option>
                                                <option value="2">11x &nbsp;de&nbsp; {{((total + (total * 0.0799))/11) | currency}}</option>
                                                <option value="2">12x &nbsp;de&nbsp; {{((total + (total * 0.0799))/12) | currency}}</option>
                                            </optgroup>
                                        </select>
                                        <label class="blue-text">Parcelamento</label>
                                    </div>
                                </div>

                                <button ng-click="" class="btn waves-effect waves-light blue lighten-2 left" type="button">Finalizar Venda
                                    <i class="material-icons right">send</i>
                                </button>
                                <br/><br/>
                            </div>
                        </li>
                    </ul>
                </div>

                <div ng-if="venda.pagamento == 'dinheiro'" class="card-action">
                    <button ng-click="" class="btn waves-effect waves-light blue lighten-2 left" type="button">Finalizar Venda
                        <i class="material-icons right">send</i>
                    </button>
                    <br/>
                </div>
            </div> <!-- ./card-content -->
        </div> <!-- ./card -->
    </div> <!-- ./card-content -->
</div> <!-- ./card -->
<br/>

