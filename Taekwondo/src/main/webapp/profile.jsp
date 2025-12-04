<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<title>TDK Academy - Editar Perfil</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/css/profile.css'/>">

</head>
<body class="bg-light">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand fw-bold" href="<c:url value='/home.jsp'/>">TDK
				Academy</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link active"
						href="<c:url value='/home.jsp'/>">Início</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/events'/>">Eventos</a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navComp"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Treinos </a>
						<ul class="dropdown-menu" aria-labelledby="navComp">
							<li><a class="dropdown-item"
								href="<c:url value='/myTraining'/>">Meus Treinos</a></li>
							<li><a class="dropdown-item"
								href="<c:url value='/training-register.jsp'/>">Cadastrar
									Treino</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/statistics.jsp'/>">Estatísticas</a></li>

				</ul>
				<div class="d-flex align-items-center text-white">
					<span class="me-3">Olá, <strong>${not empty student ? student.name : name}</strong></span>
					<a href="<c:url value='/logout'/>"
						class="btn btn-outline-light btn-sm">Sair</a>
				</div>
			</div>
		</div>
	</nav>
	<div class="container mt-5 d-flex justify-content-center">
		<div class="card p-4 col-md-6">

			<h2 class="mb-3 text-center">Alterar Faixa</h2>

			<c:if test="${not empty error}">
				<div class="alert alert-danger">${error}</div>
			</c:if>

			<p>
				<strong>Nome:</strong> ${student.name}
			</p>

			<p>
				<strong>Faixa atual:</strong> <span
					class="belt-badge belt-${fn:toLowerCase(student.belt)}">
					${student.belt.description} </span>
			</p>

			<hr>

			<form action="<c:url value='/profile'/>" method="post" class="mt-3">

				<div class="mb-3">
					<label for="belt" class="form-label fw-semibold">Selecione
						a nova faixa:</label> <select id="belt" name="belt" class="form-select">
						<c:forEach var="b" items="${belts}">
							<option value="${b}"
								${student.belt == b ? 'selected="selected"' : ''}>
								${b.description}</option>
						</c:forEach>
					</select>
				</div>

				<button type="submit" class="btn btn-primary w-100">Salvar</button>

				<a href="<c:url value='/home.jsp'/>"
					class="btn btn-secondary w-100 mt-2">Voltar</a>
			</form>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
