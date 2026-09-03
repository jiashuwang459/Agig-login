<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Profile - Agig</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-purple-950 via-violet-950 to-fuchsia-950 min-h-screen text-violet-100">
	<nav class="bg-purple-950/70 border-b border-violet-300/30 backdrop-blur-sm">
		<div class="max-w-4xl mx-auto px-4 py-4 flex items-center justify-between">
			<a href="/" class="text-2xl font-bold text-violet-200 hover:text-violet-100">Agig</a>
			<div class="flex items-center gap-2">
				<a href="home" class="bg-purple-900 hover:bg-purple-800 text-violet-100 font-semibold py-2 px-4 rounded-lg transition duration-200">Home</a>
				<a href="logout" class="bg-fuchsia-700 hover:bg-fuchsia-600 text-white font-semibold py-2 px-4 rounded-lg transition duration-200">Logout</a>
			</div>
		</div>
	</nav>

	<div class="min-h-screen flex items-center justify-center px-4 py-8">
		<div class="w-full max-w-2xl bg-purple-950/60 border border-violet-300/30 rounded-xl shadow-2xl p-8 backdrop-blur-sm">
			<div class="text-center mb-8">
				<div class="inline-block bg-violet-400/20 rounded-full p-3 mb-4">
					<span class="text-3xl font-bold text-violet-100">${user.displayName.charAt(0)}</span>
				</div>
				<h1 class="text-3xl font-bold text-violet-100 mb-1">AGENT DOSSIER</h1>
				<p class="text-violet-300 text-sm font-mono">${user.displayName}</p>
				<p class="text-violet-200 text-xs mt-2">Personnel file and access credentials</p>
			</div>

			<div class="space-y-4 bg-purple-900/50 border border-violet-300/20 rounded-lg p-6">
				<div class="flex items-center justify-between border-b border-violet-300/20 pb-4">
					<span class="text-violet-200 font-medium">Username</span>
					<span class="text-violet-100 font-semibold">${user.username}</span>
				</div>
				<div class="flex items-center justify-between pt-2">
					<span class="text-violet-200 font-medium">Email</span>
					<span class="text-violet-100 font-semibold">${user.email}</span>
				</div>
				<div class="flex items-center justify-between pt-4 border-t border-violet-300/20">
					<span class="text-violet-200 font-medium">Password</span>
					<a href="change-password" class="text-fuchsia-300 hover:text-fuchsia-200 font-semibold">Change Password</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>