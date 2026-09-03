<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if (session.getAttribute("user") != null) {
	response.sendRedirect(request.getContextPath() + "/home");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Agig - Classified Entry</title>
	<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-purple-950 via-violet-950 to-fuchsia-950 min-h-screen flex items-center justify-center px-4">
	<div class="w-full max-w-2xl bg-purple-950/70 border border-violet-300/30 rounded-xl shadow-2xl p-12 text-violet-100 backdrop-blur-sm">
		<div class="text-center mb-8">
			<div class="inline-block bg-violet-400/20 rounded-full p-4 mb-4">
				<svg class="w-12 h-12 text-violet-200" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
					<path d="M12 1a9 9 0 00-9 9v4a4 4 0 004 4h1v-8H7v8h10v-8h-1v8h1a4 4 0 004-4v-4a9 9 0 00-9-9z"/>
				</svg>
			</div>
			<h1 class="text-4xl font-bold text-violet-200 mb-2 tracking-wide">AGIG CLASSIFIED</h1>
			<p class="text-violet-100 text-lg mb-2">Intelligence Entry Gateway</p>
			<p class="text-fuchsia-300 text-sm">Clearance verification required before access</p>
		</div>

		<div class="bg-purple-900/60 border-l-4 border-violet-300 p-4 mb-8 rounded">
			<p class="text-violet-100 font-semibold mb-1">Mission Brief</p>
			<p class="text-violet-200 text-sm">Authorized personnel may proceed to secure sign-in. Activity is logged and monitored.</p>
		</div>

		<a href="login" class="block w-full bg-violet-400 hover:bg-violet-300 text-purple-950 font-bold py-3 px-4 rounded-lg text-center text-lg transition duration-200 shadow-md hover:shadow-lg">
			Open Login Console
		</a>

		<div class="mt-8 text-center text-sm text-violet-200">
			<p>Need clearance?</p>
			<a href="register" class="text-fuchsia-300 hover:text-fuchsia-200 font-semibold">Request access</a>
		</div>

		<div class="mt-8 pt-8 border-t border-violet-300/30">
			<p class="text-xs text-violet-300 text-center">Top secret area. Unauthorized access is prohibited.</p>
		</div>
	</div>
</body>
</html>
