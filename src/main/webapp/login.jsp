<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - Agig</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-purple-950 via-violet-950 to-fuchsia-950 min-h-screen text-violet-100">
	<nav class="bg-purple-950/70 border-b border-violet-300/30 backdrop-blur-sm">
		<div class="max-w-4xl mx-auto px-4 py-4 flex items-center justify-between">
			<a href="/" class="text-2xl font-bold text-violet-200 hover:text-violet-100">Agig</a>
		</div>
	</nav>
	<div class="min-h-screen flex items-center justify-center px-4">
		<div class="w-full max-w-md bg-purple-950/60 border border-violet-300/30 rounded-xl shadow-2xl p-8 backdrop-blur-sm">
			<div class="text-center mb-8">
				<div class="inline-block bg-violet-400/20 rounded-full p-3 mb-4">
					<svg class="w-8 h-8 text-violet-200" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
						<path d="M12 1a9 9 0 00-9 9v4a4 4 0 004 4h1v-8H7v8h10v-8h-1v8h1a4 4 0 004-4v-4a9 9 0 00-9-9z"/>
					</svg>
				</div>
				<h1 class="text-3xl font-bold text-violet-100 mb-1">SECURE ENTRY</h1>
				<p class="text-violet-300 text-sm font-mono">Credential Verification Required</p>
				<p class="text-violet-200 text-xs mt-2">All activity is monitored and logged</p>
			</div>

			<form method="post" action="login" class="space-y-4">
				<!-- Username Field -->
				<div>
					<label for="username" class="block text-sm font-medium text-violet-200 mb-2">Authorized Personnel ID</label>
					<input type="text" id="username" name="username" required
						class="w-full px-4 py-2 border border-violet-300/40 bg-purple-900/50 text-violet-100 rounded-lg focus:outline-none focus:ring-2 focus:ring-violet-300 focus:border-transparent" />
				</div>

				<!-- Password Field -->
				<div>
					<label for="password" class="block text-sm font-medium text-violet-200 mb-2">Security Passphrase</label>
					<input type="password" id="password" name="password" required
						class="w-full px-4 py-2 border border-violet-300/40 bg-purple-900/50 text-violet-100 rounded-lg focus:outline-none focus:ring-2 focus:ring-violet-300 focus:border-transparent" />
					<div class="mt-2 text-right">
						<a href="forgot-password" class="text-sm text-fuchsia-300 hover:text-fuchsia-200 font-semibold">Credentials compromised?</a>
					</div>
				</div>

				<!-- Submit Button -->
				<button type="submit" class="w-full bg-violet-400 hover:bg-violet-300 text-purple-950 font-semibold py-2 px-4 rounded-lg transition duration-200">
					Verify & Proceed
				</button>
			</form>

			<!-- Success Message -->
			<%
			if (request.getParameter("created") != null) {
			%>
			<div class="mt-4 p-3 bg-violet-900/40 border border-violet-300/40 text-violet-100 rounded-lg text-sm">
				✓ Access request approved. Credentials activated and ready for use.
			</div>
			<%
			}
			%>

			<!-- Error Message -->
			<%
			if (request.getParameter("error") != null) {
			%>
			<div class="mt-4 p-3 bg-fuchsia-900/40 border border-fuchsia-400/40 text-fuchsia-100 rounded-lg text-sm">
				✗ Authentication failed. Invalid credentials provided. Attempt logged.
			</div>
			<%
			}
			%>

			<!-- Sign Up Link -->
			<div class="mt-6 text-center">
				<p class="text-violet-200 text-sm">Awaiting clearance? 
					<a href="register" class="text-fuchsia-300 hover:text-fuchsia-200 font-semibold">Request access</a>
				</p>
			</div>

			<div class="mt-6 pt-6 border-t border-violet-300/20">
				<p class="text-xs text-violet-300 text-center font-mono">[NOTICE] Unauthorized access attempts will be recorded and investigated.</p>
			</div>
		</div>
	</div>
</body>
</html>