<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Meus Treinos</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="<c:url value='/css/my-training-style.css'/>">
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
            <a class="nav-link" href="<c:url value='/home.jsp'/>">Início</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Eventos</a>
          </li>

          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle active" id="navComp" role="button"
               data-bs-toggle="dropdown" aria-expanded="false">
              Treinos
            </a>
            <li class="nav-item">
			    <a class="nav-link" href="<c:url value='/statistics.jsp'/>">Estatísticas</a>
			</li>
            
            <ul class="dropdown-menu" aria-labelledby="navComp">
              <li><a class="dropdown-item" href="<c:url value='/myTraining'/>">Meus Treinos</a></li>
              <li><a class="dropdown-item" href="<c:url value='/training'/>">Cadastrar Treino</a></li>
            </ul>
          </li>
        </ul>
        <div class="d-flex align-items-center text-white">
          <span class="me-3">
            Olá, <strong>${not empty student ? student.name : name}</strong>
          </span>
          <a href="<c:url value='/logout'/>" class="btn btn-outline-light btn-sm">Sair</a>
        </div>
      </div>
    </div>
  </nav>

  <div class="container mt-5">
    <h2 class="text-center mb-4">Meus Treinos</h2>

    <form action="<c:url value='/trainingSearch'/>" method="post" class="mb-4">
      <div class="row g-3">
        <div class="col-12 col-md-4">
          <label for="type" class="form-label">Tipo</label>
          <select class="form-select" name="type" id="type">
            <option value="" selected>Todos</option>
            <option value="POOMSE">Poomse</option>
            <option value="LUTA">Luta</option>
            <option value="TECNICA">Técnica</option>
            <option value="CONDICIONAMENTO">Condicionamento</option>
            <option value="FLEXIBILIDADE">Flexibilidade</option>
          </select>
        </div>

        <div class="col-12 col-md-3">
          <label for="initial-date" class="form-label">Data inicial</label>
          <input type="date" class="form-control" id="initial-date" name="initial-date">
        </div>

        <div class="col-12 col-md-3">
          <label for="final-date" class="form-label">Data final</label>
          <input type="date" class="form-control" id="final-date" name="final-date">
        </div>

        <div class="col-12 col-md-2 d-flex align-items-end">
          <button type="submit" class="btn btn-primary w-100">Filtrar</button>
        </div>
      </div>
    </form>

    <c:choose>
      <c:when test="${not empty trainings}">
        <div class="table-responsive">
          <table class="table table-striped table-hover align-middle">
            <thead class="table-dark">
              <tr>
                <th>#</th>
                <th>Tipo</th>
                <th>Data</th>
                <th class="text-center">Ações</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="t" items="${trainings}" varStatus="st">
                <tr>
                  <td>${st.count}</td>
                  <td>${t.type}</td>
                  <td>
                    <fmt:parseDate value="${t.date}" pattern="yyyy-MM-dd" var="parsed" type="date"/>
                    <fmt:formatDate value="${parsed}" pattern="dd/MM/yyyy"/>
                  </td>
                  <td class="text-center">
                    <a class="btn btn-sm btn-outline-primary me-1"
                       data-bs-toggle="tooltip"
                       data-bs-placement="top"
                       title="Editar"
                       href="<c:url value='/training?action=edit&id=${t.id}'/>">
                      <jsp:include page="img/edit-pencil-icon.jsp" />
                    </a>

                    <button class="btn btn-sm btn-outline-danger"
                            type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#myModal"
                            data-bs-id="${t.id}">
                      <span data-bs-toggle="tooltip"
                            data-bs-placement="top"
                            title="Excluir">
                        <jsp:include page="img/trash-icon.jsp" />
                      </span>
                    </button>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </c:when>
      <c:otherwise>
        <div class="alert alert-warning text-center">
          Nenhum treino registrado até o momento.
        </div>
      </c:otherwise>
    </c:choose>

    <div class="d-flex justify-content-center gap-2 mt-4">
      <a href="<c:url value='/training-register.jsp'/>" class="btn btn-primary">
        Cadastrar novo treino
      </a>
      <a href="<c:url value='/home.jsp'/>" class="btn btn-secondary">
        Voltar
      </a>
    </div>
  </div>

  <div class="modal" tabindex="-1" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Exclusão</h5>
          <button type="button"
                  class="btn-close"
                  data-bs-dismiss="modal"
                  aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <p>Tem certeza que deseja excluir este treino?</p>
        </div>
        <div class="modal-footer">
          <button type="button"
                  class="btn btn-secondary"
                  data-bs-dismiss="modal">Cancelar</button>
          <button type="button"
                  id="delete"
                  class="btn btn-danger">Excluir</button>
        </div>
      </div>
    </div>
  </div>

  <script>
    const contextPath = '${pageContext.request.contextPath}';
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript" src="<c:url value='/js/my-training.js'/>"></script>
</body>
</html>
