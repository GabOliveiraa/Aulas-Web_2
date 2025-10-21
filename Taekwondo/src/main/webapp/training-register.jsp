<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Cadastrar Treino</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/css/training-style.css'/>">
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
            <a class="nav-link dropdown-toggle active" href="#" id="navComp" role="button" data-bs-toggle="dropdown" aria-expanded="false">
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
  
<div class="container mt-5">
  <div class="col-lg-6 offset-lg-3 col-sm-12">

    <c:if test="${result == 'registered'}">
      <div class="alert alert-success alert-dismissible fade show" role="alert">
        Treino cadastrado com sucesso.
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
      </div>
    </c:if>
    <c:if test="${result == 'notRegistered'}">
      <div class="alert alert-danger alert-dismissible fade show" role="alert">
        Não foi possível cadastrar o treino. Faça login novamente.
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
      </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/training" method="post" id="form1">
	  <c:choose>
	    <c:when test="${empty training}">
	      <h1 class="text-center">Novo Treino</h1>
	      <input type="hidden" name="id" value="0">
	    </c:when>
	    <c:otherwise>
	      <h1 class="text-center">Editar Treino</h1>
	      <input type="hidden" name="id" value="${training.id}">
	    </c:otherwise>
	  </c:choose>
	
	  <div class="mb-2">
	    <label for="type">Tipo*</label>
	    <select class="form-select" name="type" id="type" required>
	      <option disabled selected>Selecione</option>
	      <option value="POOMSE" ${training.type == 'POOMSE' ? 'selected' : ''}>Poomse</option>
	      <option value="LUTA" ${training.type == 'LUTA' ? 'selected' : ''}>Luta</option>
	      <option value="TECNICA" ${training.type == 'TECNICA' ? 'selected' : ''}>Técnica</option>
	      <option value="CONDICIONAMENTO" ${training.type == 'CONDICIONAMENTO' ? 'selected' : ''}>Condicionamento</option>
	      <option value="FLEXIBILIDADE" ${training.type == 'FLEXIBILIDADE' ? 'selected' : ''}>Flexibilidade</option>
	    </select>
	  </div>
	
	  <div class="mb-2">
	    <label for="date">Data*</label>
	    <input type="date" class="form-control" name="date" id="date" required
	           value="${not empty training ? training.date : ''}">
	  </div>
	
	  <div class="col-12 mb-2">
	    <button type="submit" class="btn btn-primary">Salvar</button>
	  </div>
	</form>

  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>