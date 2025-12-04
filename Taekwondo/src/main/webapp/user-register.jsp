<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!doctype html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet">

<title>Cadastro de Aluno</title>
</head>
<body>
	<div class="container mt-4">
		<div class="col-lg-6 offset-lg-3 col-sm-12">

			<c:if test="${result == 'notRegistered'}">
				<div class="alert alert-danger alert-dismissible fade show"
					role="alert">
					E-mail já cadastrado. Tente novamente.
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>

			<form action="<c:url value='/studentRegisterServlet'/>" method="post"
				id="form1">
				<h1 class="text-center mb-4">Cadastro de Aluno</h1>

				<div class="mb-2">
					<label for="name">Nome completo*</label> <input type="text"
						name="name" id="name" class="form-control" minlength="3"
						maxlength="80" required> <span id="0"></span>
				</div>

				<div class="mb-2">
					<label for="email">E-mail*</label> <input type="email" name="email"
						id="email" class="form-control" required> <span id="1"></span>
				</div>

				<div class="mb-2">
					<label for="password">Senha*</label> <input type="password"
						name="password" id="password" class="form-control" minlength="6"
						maxlength="12" required> <span id="2"></span>
				</div>

				<div class="mb-2">
					<label for="confirmPassword">Confirmação de Senha*</label> <input
						type="password" name="confirmPassword" id="confirmPassword"
						class="form-control" minlength="6" maxlength="12" required>
					<span id="3"></span>
				</div>

				<div class="mb-2">
					<label for="birthDate">Data de Nascimento*</label> <input
						type="date" name="birthDate" id="birthDate" class="form-control"
						required> <span id="4"></span>
				</div>

				<div class="mb-2">
					<label for="gender">Gênero*</label> <select class="form-select"
						name="gender" id="gender" required>
						<option value="" selected>Selecione</option>
						<option value="MASCULINO">Masculino</option>
						<option value="FEMININO">Feminino</option>
						<option value="OUTRO">Outro</option>
						<option value="PREFIRO_NAO_DIZER">Prefiro não dizer</option>
					</select> <span id="5"></span>
				</div>

				<div class="mb-2">
					<label for="belt">Faixa atual*</label> <select class="form-select"
						name="belt" id="belt" required>
						<option value="" selected>Selecione</option>
						<option value="BRANCA">Branca</option>
						<option value="AMARELA">Amarela</option>
						<option value="AMARELA_PONTA_VERDE">Amarela ponta verde</option>
						<option value="VERDE">Verde</option>
						<option value="VERDE_PONTA_AZUL">Verde ponta azul</option>
						<option value="AZUL">Azul</option>
						<option value="AZUL_PONTA_VERMELHA">Azul ponta vermelha</option>
						<option value="VERMELHA">Vermelha</option>
						<option value="VERMELHA_PONTA_PRETA">Vermelha ponta preta</option>
						<option value="PRETA">Preta</option>
					</select>
				</div>

				<div class="mb-2">
					<button type="submit" class="btn btn-warning w-100">Salvar</button>
				</div>
			</form>

			<div class="text-center mt-3">
				<a href="<c:url value='/login.jsp'/>">Já tem conta? Fazer login</a>
			</div>

		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
  </script>
	<script src="<c:url value='/js/user-register.js'/>"></script>
</body>
</html>