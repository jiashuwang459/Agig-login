<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Error 404 - Access Denied</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-purple-950 via-violet-950 to-fuchsia-950 min-h-screen text-violet-100 overflow-hidden">
	<!-- Animated background grid -->
	<div class="fixed inset-0 opacity-10 pointer-events-none">
		<div class="absolute inset-0" style="background-image: 
			linear-gradient(0deg, transparent 24%, rgba(139, 92, 246, .05) 25%, rgba(139, 92, 246, .05) 26%, transparent 27%, transparent 74%, rgba(139, 92, 246, .05) 75%, rgba(139, 92, 246, .05) 76%, transparent 77%, transparent),
			linear-gradient(90deg, transparent 24%, rgba(139, 92, 246, .05) 25%, rgba(139, 92, 246, .05) 26%, transparent 27%, transparent 74%, rgba(139, 92, 246, .05) 75%, rgba(139, 92, 246, .05) 76%, transparent 77%, transparent);
			background-size: 50px 50px;">
		</div>
	</div>

	<!-- Logo -->
	<div class="fixed top-6 left-6 z-50">
		<a href="/" class="text-2xl font-bold text-violet-200 hover:text-violet-100 transition">Agig</a>
	</div>

	<!-- Main content -->
	<div class="relative z-10 min-h-screen flex items-center justify-center px-4 py-12">
		<div class="w-full max-w-2xl">
			<!-- Error code -->
			<div class="text-center mb-8">
				<div class="relative inline-block">
					<div class="text-9xl font-black text-transparent bg-clip-text bg-gradient-to-r from-violet-400 via-fuchsia-400 to-violet-400 animate-pulse">
						404
					</div>
					<div class="absolute inset-0 text-9xl font-black text-violet-600/20 blur-xl">
						404
					</div>
				</div>
			</div>

			<!-- Warning box -->
			<div class="bg-red-950/40 border-2 border-red-500/60 rounded-lg p-6 mb-8 backdrop-blur-sm">
				<div class="flex items-start gap-4">
					<div class="flex-shrink-0 text-red-400 text-2xl">⚠️</div>
					<div>
						<h1 class="text-2xl font-bold text-red-300 mb-2">FORBIDDEN SECTOR</h1>
						<p class="text-red-200/80 font-mono text-sm leading-relaxed">
							You have attempted to access classified material. This incident has been <span class="text-red-400 font-bold">LOGGED</span> and flagged for investigation.
						</p>
					</div>
				</div>
			</div>

			<!-- Main message -->
			<div class="bg-purple-950/60 border border-violet-300/30 rounded-xl shadow-2xl p-8 backdrop-blur-sm mb-8">
				<h2 class="text-2xl font-bold text-violet-100 mb-4">UNAUTHORIZED ACCESS DETECTED</h2>
				
				<div class="space-y-4 text-violet-200/90 font-mono text-sm">
					<p>
						<span class="text-yellow-400">[ALERT]</span> The page you are attempting to access does not exist or has been classified beyond your clearance level.
					</p>
					
					<div class="border-l-2 border-fuchsia-500/40 pl-4 py-2 bg-fuchsia-950/20 rounded">
						<p class="text-fuchsia-300 font-semibold">ACCESS DENIED - ERROR 404</p>
						<p class="text-violet-300 mt-1">Requested resource: <span class="text-fuchsia-200">&lt;REDACTED&gt;</span></p>
						<p class="text-violet-300">Timestamp: <span class="text-fuchsia-200" id="timestamp"></span></p>
						<p class="text-violet-300">Your access attempt is being monitored.</p>
					</div>

					<p class="pt-4">
						<span class="text-yellow-400">[WARNING]</span> Further unauthorized attempts to access restricted areas may result in account suspension or investigation by security personnel.
					</p>
				</div>
			</div>

			<!-- Action buttons -->
			<div class="flex flex-col sm:flex-row gap-4 justify-center">
				<% if (session != null && session.getAttribute("user") != null) { %>
					<a href="home" class="flex-1 sm:flex-none px-6 py-3 bg-purple-700 hover:bg-purple-600 text-white font-bold rounded-lg transition duration-200 text-center">
						Return to Home
					</a>
					<a href="profile" class="flex-1 sm:flex-none px-6 py-3 bg-violet-700 hover:bg-violet-600 text-white font-bold rounded-lg transition duration-200 text-center">
						View Profile
					</a>
				<% } else { %>
					<a href="/" class="flex-1 sm:flex-none px-6 py-3 bg-purple-700 hover:bg-purple-600 text-white font-bold rounded-lg transition duration-200 text-center">
						Return to Main
					</a>
					<a href="login" class="flex-1 sm:flex-none px-6 py-3 bg-violet-700 hover:bg-violet-600 text-white font-bold rounded-lg transition duration-200 text-center">
						Login
					</a>
				<% } %>
			</div>

			<!-- Footer message -->
			<div class="mt-8 text-center">
				<p class="text-violet-300/60 text-xs font-mono">
					[SYSTEM] All unauthorized access attempts are logged and monitored. Proceed carefully.
				</p>
			</div>
		</div>
	</div>

	<script>
		// Display current timestamp
		const now = new Date();
		const timestamp = now.toISOString().replace('T', ' ').substring(0, 19);
		document.getElementById('timestamp').textContent = timestamp + ' UTC';

		// Log animation effect
		const messages = [
			'[SYSTEM] Unauthorized access attempt recorded',
			'[SECURITY] Access violation detected',
			'[LOG] Request from user logged and flagged'
		];

		let messageIndex = 0;
		setInterval(() => {
			// Subtle visual feedback - you could add a console message
			console.log(messages[messageIndex % messages.length]);
			messageIndex++;
		}, 3000);
	</script>
</body>
</html>