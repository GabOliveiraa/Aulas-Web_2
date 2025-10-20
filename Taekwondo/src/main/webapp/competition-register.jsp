<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Taekwondo - Cadastro de Campeonato</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/styles.css">
</head>
<body>
  <div class="container">
    <div class="center col-lg-6 offset-lg-3 col-sm-12">

      <c:if test="${result == 'registered'}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
          Campeonato cadastrado com sucesso.
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
      </c:if>

      <c:if test="${result == 'notRegistered'}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
          Campeonato não cadastrado. Faça o login.
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
      </c:if>

      <form action="competitionRegister" method="post" id="form1">
        <h1 class="text-center">Novo Campeonato</h1>

        <div class="mb-2">
          <label for="competitionType">Tipo de competição*</label>
          <select class="form-select" name="competitionType" id="competitionType" required>
            <option value="" selected>Selecione</option>
            <option value="LOCAL">Local</option>
            <option value="REGIONAL">Regional</option>
            <option value="ESTADUAL">Estadual</option>
          </select>
        </div>

        <div class="mb-2">
          <label for="category">Categoria*</label>
          <input type="text" name="category" id="category" class="form-control" required>
        </div>

        <div class="mb-2">
          <label for="result">Resultado*</label>
          <select class="form-select" name="result" id="result" required>
            <option value="" selected>Selecione</option>
            <option value="VITORIA">Vitória</option>
            <option value="DERROTA">Derrota</option>
            <option value="EMPATE">Empate</option>
          </select>
        </div>

        <div class="mb-2">
          <label for="eventDate">Data*</label>
          <input type="date" name="eventDate" id="eventDate" class="form-control" required>
        </div>

        <div class="col-12 mb-2">
          <button type="submit" class="btn btn-primary">Salvar</button>
        </div>
      </form>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
