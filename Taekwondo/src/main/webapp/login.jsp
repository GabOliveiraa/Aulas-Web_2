<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/css/login.css'/>">
    <title>Login</title>
</head>

<body class="bg-light d-flex align-items-center justify-content-center vh-100">

  <div class="card shadow" style="max-width: 500px; width: 100%; max-height: 550px; height: 100%;">
    <div class="logo-center mb-4 text-center p-3">
      <h2>Login</h2>
    </div>

    <div class="p-4">
    
      <c:choose>
        <c:when test="${result == 'registered'}">
          <div class="alert alert-success alert-dismissible fade show" role="alert">
            Usuário cadastrado com sucesso! Faça o login.
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
          </div>
        </c:when>
        <c:when test="${result == 'loginError'}">
          <div class="alert alert-danger alert-dismissible fade show" role="alert">
            E-mail ou senha inválidos.
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
          </div>
        </c:when>
      </c:choose>

      <form action="${pageContext.request.contextPath}/loginServlet" method="post">
        <div class="mb-3">
          <label for="emailAdm" class="form-label">Usuário</label>
          <input type="email" class="form-control" id="emailAdm" name="email" required>
        </div>

        <div class="mb-3">
          <label for="senhaAdm" class="form-label">Senha</label>
          <input type="password" class="form-control" id="senhaAdm" name="password" required>
        </div>

        <div class="d-flex justify-content-between align-items-center mb-3">
          <label class="chk"><input type="checkbox" id="amarelo"> Lembrar-me</label>
          <a class="link" href="#">Esqueci minha senha</a>
        </div>

        <button type="submit" class="btn btn-warning w-100">Entrar</button>
      </form>

      <div class="text-center mt-3">
        <a href="${pageContext.request.contextPath}/user-register.jsp" class="text-decoration-none">
          Ainda não tem cadastro? Clique aqui
        </a>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>