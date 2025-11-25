<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>TDK Academy - Estatísticas</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand fw-bold" href="<c:url value='/home.jsp'/>">TDK Academy</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/home.jsp'/>">Início</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Eventos</a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navComp" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        Treinos
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navComp">
                        <li><a class="dropdown-item" href="<c:url value='/myTraining'/>">Meus Treinos</a></li>
                        <li><a class="dropdown-item" href="<c:url value='/training'/>">Cadastrar Treino</a></li>
                    </ul>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" href="<c:url value='/statistics.jsp'/>">Estatísticas</a>
                </li>
            </ul>
            <div class="d-flex align-items-center text-white">
                <span class="me-3">Olá, <strong>${not empty student ? student.name : name}</strong></span>
                <a href="<c:url value='/logout'/>" class="btn btn-outline-light btn-sm">Sair</a>
            </div>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <div class="row my-3">
        <div class="col">
            <h4>Estatísticas dos Treinos</h4>
        </div>
    </div>
    <div class="row my-2">
        <div class="col-md-6 py-1">
            <div class="card">
                <h5 class="card-title text-center mt-2">Treinos por tipo</h5>
                <div class="card-body">
                    <canvas id="chDonut1"></canvas>
                </div>
            </div>
        </div>
        <div class="col-md-6 py-1">
            <div class="card">
                <h5 class="card-title text-center mt-2">Treinos por dia</h5>
                <div class="card-body">
                    <canvas id="chBar"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js"></script>
<script type="text/javascript" src="<c:url value='/js/statistics.js'/>"></script>

</body>
</html>
