<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%
    if (session.getAttribute("student") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Área do Aluno</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="<c:url value='/css/home.css'/>">
</head>

<body class="bg-light">

  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
      <a class="navbar-brand fw-bold" href="<c:url value='/home.jsp'/>">TDK Academy</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav me-auto">
          <li class="nav-item">
            <a class="nav-link active" href="<c:url value='/home.jsp'/>">Início</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Eventos</a>
          </li>

          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navComp" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Treinos
            </a>
            <ul class="dropdown-menu" aria-labelledby="navComp">
              <li><a class="dropdown-item" href="${pageContext.request.contextPath}/myTraining">Meus Treinos</a></li>
					<li><a class="dropdown-item" href="${pageContext.request.contextPath}/training">Cadastrar Treino</a></li>
            </ul>
          </li>
        </ul>
        <div class="d-flex align-items-center text-white">
          <span class="me-3">Olá, <strong>${not empty student ? student.name : name}</strong></span>
          <a href="<c:url value='/logout'/>" class="btn btn-outline-light btn-sm">Sair</a>
        </div>
      </div>
    </div>
  </nav>

  <main class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-lg-8">
        <div class="card shadow-sm border-0">
          <div class="card-body text-center">
            <h3 class="card-title mb-3">Bem-vindo, ${student.name}!</h3>
            <p class="lead">Você está logado como aluno da academia <strong>TDK Academy</strong>.</p>

            <hr>

            <div class="row mt-4">
              <div class="col-md-6">
                <p><strong>E-mail:</strong> ${student.email}</p>
                <p><strong>Data de nascimento:</strong> ${student.birthDateBr}</p>
              </div>
              <div class="col-md-6">
                <p><strong>Gênero:</strong> ${student.gender}</p>
                <p><strong>Faixa:</strong>
                  <span class="badge text-dark bg-transparent">${student.belt}</span>
                </p>
              </div>
            </div>

            <div class="mt-4 d-flex gap-2 justify-content-center">
              <a href="<c:url value='/myTraining'/>" class="btn btn-primary">Ver Treinos</a>
              <a href="#" class="btn btn-secondary">Editar Perfil</a>
            </div>	

          </div>
        </div>
      </div>
    </div>
  </main>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
