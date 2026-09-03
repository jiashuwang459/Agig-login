package com.agig;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet({ "/home", "/landing" })
public class HomeServlet extends HttpServlet {

	private static final long serialVersionUID = 6543791369762667786L;

	// TODO: Replace these placeholder missions with real content or logic to fetch missions from a database or service.
	private static final Mission[] COVER_MISSIONS = {
			new Mission(
					"Operation Compliance Echo",
					"Calibrate the internal stapler alignment protocol before quarterly optics review.",
					"\"Critical\" (administrative)",
					"Break Room Cabinet B",
					"Pending memo approval",
					"Paperwork packet decoded. Deliver high-importance tone with low-importance outcomes.",
					"AGIG:OFFICE-DELTA / TASK: RE-INDEX-PAPERCLIPS"),
			new Mission(
					"Project Nimbus Ledger",
					"Reconcile archive binder tabs to maintain strategic filing symmetry.",
					"HIGH (clerical)",
					"Records Wing 2C",
					"Waiting on label-printer toner",
					"Intelligence packet indicates tabs must be sorted by shade, not by date.",
					"AGIG:CLERK-SIGMA / TASK: TAB-HARMONIZATION"),
			new Mission(
					"Taskforce Velvet Clipboard",
					"Audit conference room marker inventory for mission-readiness optics.",
					"MEDIUM",
					"Stationery Vault",
					"Escalated for signature chain",
					"Briefing appears sensitive until page two reveals a pen-cap discrepancy report.",
					"AGIG:SUPPLY-ALPHA / TASK: MARKER-AUDIT"),
			new Mission(
					"Protocol Lunar Inbox",
					"Triangulate unread notification counts and produce an urgent dashboard.",
					"SEVERE (presentation only)",
					"Comms Node N-4",
					"Blocked by calendar invite formatting",
					"Decoded stream confirms this mission is mostly slide polish with dramatic labels.",
					"AGIG:OPS-TAU / TASK: INBOX-METRICS-REFORMAT") };

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if ("/landing".equals(request.getServletPath())) {
			response.sendRedirect("home");
			return;
		}

		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("user") == null) {
			response.sendRedirect("login");
			return;
		}

		User user = (User) session.getAttribute("user");
		session.removeAttribute("pendingAccessGrant");
		Mission mission = selectMission(user.getUsername());
		request.setAttribute("missionTitle", mission.title);
		request.setAttribute("missionSummary", mission.summary);
		request.setAttribute("missionPriority", mission.priority);
		request.setAttribute("missionRegion", mission.region);
		request.setAttribute("missionStatus", mission.status);
		request.setAttribute("notesSummary", mission.notesSummary);
		request.setAttribute("notesPayload", mission.notesPayload);

		request.getRequestDispatcher("/home.jsp").forward(request, response);
	}

	private Mission selectMission(String username) {
		if ("hostedftp".equals(username)) {
			return new Mission(
					"Top Secret Mission",
					"Review Jiashu Wang's job application dossier before final panel clearance.",
					"TOP SECRET",
					"Applicant Review Cell",
					"Awaiting executive sign-off",
					"Dossier packet decrypted. Candidate profile cross-check in progress.",
					"AGIG:HR-OMEGA / MISSION: REVIEW-JIASHU-WANG-APPLICATION");
		}

		if ("jiashuwang459".equals(username)) {
			return new Mission(
					"Top Secret Mission",
					"Infiltrate hostedftp's headquarters and extract the blue folder.",
					"BLACK OPS",
					"HostedFTP HQ",
					"Awaiting go-code ORCHID-9",
					"Infiltration packet decoded. Headquarters map and badge relay loaded.",
					"AGIG:PHANTOM-ENTRY / TARGET: HOSTEDFTP-HQ");
		}

		int missionIndex = Math.floorMod(username.toLowerCase().hashCode(), COVER_MISSIONS.length);
		return COVER_MISSIONS[missionIndex];
	}

	private static class Mission {
		private final String title;
		private final String summary;
		private final String priority;
		private final String region;
		private final String status;
		private final String notesSummary;
		private final String notesPayload;

		private Mission(String title, String summary, String priority, String region, String status, String notesSummary,
				String notesPayload) {
			this.title = title;
			this.summary = summary;
			this.priority = priority;
			this.region = region;
			this.status = status;
			this.notesSummary = notesSummary;
			this.notesPayload = notesPayload;
		}
	}
}
