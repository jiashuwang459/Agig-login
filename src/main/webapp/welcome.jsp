<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome!</title>
</head>
<body>
	<h1>Welcome, ${user.displayName}!</h1>

	<p>Username: ${user.username}</p>
	<p>Email: ${user.email}</p>
</body>
</html>