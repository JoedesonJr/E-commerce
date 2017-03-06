<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- CAMINHO -->
<nav>
    <div class="nav-wrapper blue lighten-2">
        <div class="col s12">
            <a href="#" class="breadcrumb"></a>
            <a href="#" class="breadcrumb">Vendas</a>
            <a href="#" class="breadcrumb">Visualizar Vendas</a>
        </div>
    </div>
</nav>

<!-- CADASTRAR GRUPO -->
<div class="card grey lighten-5" style="margin-top: 2%">
    <div class="card-content">
        <!-- TITULO -->
        <i class="material-icons medium left grey-text text-darken-3">shopping_cart</i>
        <h4 class="thin grey-text text-darken-3">
            Visualizar Vendas
        </h4>
        <br/>

        <div class="row center-align">
            <!-- HOJE -->
            <div class="col l3 m3 s12">
                <div class="card">
                    <div class="card-content green white-text">
                        <p class="card-title">Hoje</p>
                        <h3 class="card-stats-number">56</h3>
                        <p class="card-stats-compare">
                            <span class="green-text text-lighten-5 ">Média de 63/dia</span>
                        </p>
                    </div>
                    <div class="card-action  green darken-2">
                        <div class="card-title white-text">R$ 532,10</div>
                    </div>
                </div>
            </div>
            <!-- SEMANA -->
            <div class="col l3 m3 s12">
                <div class="card">
                    <div class="card-content pink lighten-1 white-text">
                        <p class="card-title">Esta Semana</p>
                        <h3 class="card-stats-number">211</h3>
                        <p class="card-stats-compare">
                            <span class="green-text text-lighten-5">Média de 203/semana</span>
                        </p>
                    </div>
                    <div class="card-action pink darken-2">
                        <div class="card-title white-text">
                            R$ 7.163,33
                        </div>
                    </div>
                </div>
            </div>
            <!-- MES -->
            <div class="col l3 m3 s12">
                <div class="card">
                    <div class="card-content blue-grey white-text">
                        <p class="card-title">Este Mês</p>
                        <h3 class="card-stats-number">576</h3>
                        <p class="card-stats-compare"><span class="green-text text-lighten-5">Média de 610/mês</span>
                        </p>
                    </div>
                    <div class="card-action blue-grey darken-2">
                        <div class="card-title white-text">
                            R$ 18.415,83
                        </div>
                    </div>
                </div>
            </div>
            <!-- TOTAL -->
            <div class="col l3 m3 s12">
                <div class="card">
                    <div class="card-content purple white-text">
                        <p class="card-title">Este Ano</p>
                        <h3 class="card-stats-number">3752</h3>
                        <p class="card-stats-compare"><span class="green-text text-lighten-5">Média de 3.748/ano</span>
                    </div>
                    <div class="card-action purple darken-2">
                        <div class="card-title white-text">
                            R$ 98.492,71
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- ./card-content -->
</div> <!-- ./card -->

<!-- CADASTRAR GRUPO -->
<div class="card grey lighten-5" style="margin-top: 2%">
    <div class="card-content">
        <!-- TITULO -->
        <i class="material-icons medium left grey-text text-darken-3 hide-on-small-only">trending_up</i>
        <h4 class="thin grey-text text-darken-3">
            Relatório completo de vendas
        </h4>
        <br/>

        <div class="row">
            <div class="col l6 m6 s12">
                <ul class="collapsible" data-collapsible="accordion">
                    <li>
                        <div class="collapsible-header"><i class="material-icons">list</i>Por dia</div>
                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons">list</i>Por semana</div>
                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons">list</i>Por mês</div>
                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons">list</i>Por ano</div>
                    </li>
                </ul>
            </div>
            <div class="col l6 m6 s12">
                <ul class="collapsible" data-collapsible="accordion">
                    <li>
                        <div class="collapsible-header"><i class="material-icons">supervisor_account</i>Por representante</div>
                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons">redeem</i>Por produto</div>
                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons">perm_identity</i>Por cliente</div>
                    </li>
                    <li>
                        <div class="collapsible-header"><i class="material-icons">dashboard</i>Por grupo</div>
                    </li>
                </ul>
            </div>
        </div>
    </div> <!-- ./card-content -->
</div> <!-- ./card -->
<br/>

