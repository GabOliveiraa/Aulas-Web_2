<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<%-- protege a página: exige aluno na sessão --%>
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
	            <a class="nav-link dropdown-toggle active" id="navComp" role="button" data-bs-toggle="dropdown" aria-expanded="false">
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
    <h2 class="text-center mb-4">Meus Treinos</h2>

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
			             title="Editar"
			             href="${pageContext.request.contextPath}/training?action=edit&id=${t.id}">
			            <jsp:include page="img/edit-pencil-icon.jsp" />
			          </a>
			
			          <a class="btn btn-sm btn-outline-danger"
			             title="Excluir"
			             href="${pageContext.request.contextPath}/training?action=delete&id=${t.id}"
			             onclick="return confirm('Excluir este treino?');">
			            <jsp:include page="img/trash-icon.jsp" />
			          </a>
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
      <a href="${pageContext.request.contextPath}/training-register.jsp" class="btn btn-primary">
        Cadastrar novo treino
      </a>
      <a href="${pageContext.request.contextPath}/home.jsp" class="btn btn-secondary">
        Voltar
      </a>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
