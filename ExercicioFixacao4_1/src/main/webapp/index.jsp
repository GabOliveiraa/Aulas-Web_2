<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="UTF-8">
	<title>Login</title>
</head>
<body>
	<h2>Autenticação</h2>
	<form action="LoginServlet" method="post">
		<label for="email">E-mail: </label>
		<input type="email" id="email" name="email" required><br>
		<label for="password">Senha: </label>
		<input type="password" id="password" name="password" required><br><br>
		<button type="submit">Entrar</button>
	</form>
</body>
</html>