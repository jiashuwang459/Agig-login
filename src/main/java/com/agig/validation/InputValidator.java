package com.agig.validation;

import java.util.regex.Pattern;

public final class InputValidator {

	// Alphanumeric + underscore, 3-50 chars
	private static final Pattern USERNAME = Pattern.compile("^[a-zA-Z0-9_]{3,50}$");

	// Robust RFC-compliant basic email check
	private static final Pattern EMAIL = Pattern.compile("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$");

	// TODO: Support international unicode names, spaces, hyphens, and apostrophes
	// private static final Pattern NAME = Pattern.compile("^[\\p{L}\\s'-]{1,50}$");

	// Restricts names strictly to ASCII letters, spaces, hyphens, and apostrophes
	// (1-50 chars)
	private static final Pattern NAME = Pattern.compile("^[a-zA-Z\\s'-]{1,50}$");

	// Enforces 4-type complexity, but allows any character (like spaces or '#') up
	// to 128 chars
	private static final Pattern PASSWORD = Pattern
			.compile("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&]).{12,128}$");

	private InputValidator() {
	}

	public static String validateUsername(String username) throws ValidationException {
		if (username == null) {
			throw new ValidationException("username", "Username is required");
		}

		username = username.trim();

		if (!USERNAME.matcher(username).matches()) {
			throw new ValidationException("username",
					"Username must be 3-50 characters and contain only letters, numbers, and underscores");
		}

		return username;
	}

	public static String validateFirstName(String name) throws ValidationException {
		return validateName(name, "firstName", "First Name");
	}

	public static String validateLastName(String name) throws ValidationException {
		return validateName(name, "lastName", "Last Name");
	}

	public static String validateName(String name, String fieldKey, String fieldName) throws ValidationException {

		if (name == null) {
			throw new ValidationException(fieldKey, fieldName + " is required");
		}

		name = name.trim();

		if (name.isEmpty() || name.length() > 50) {
			throw new ValidationException(fieldKey, fieldName + " must be between 1 and 50 characters");
		}

		if (!NAME.matcher(name).matches()) {
			throw new ValidationException(fieldKey,
					fieldName + " can only contain letters, spaces, hyphens, and apostrophes");
		}

		return name;
	}

	public static String validateEmail(String email) throws ValidationException {
		if (email == null) {
			throw new ValidationException("email", "Email is required");
		}

		email = email.trim();

		if (email.length() > 255 || !EMAIL.matcher(email).matches()) {

			throw new ValidationException("email", "Invalid email address");
		}

		return email;
	}

	public static String validatePassword(String password) throws ValidationException {
		if (password == null) {
			throw new ValidationException("password", "Password is required");
		}

		if (!PASSWORD.matcher(password).matches()) {
			throw new ValidationException("password",
					"Password must be 12-128 characters and contain uppercase, lowercase, numbers, and special characters (@$!%*?&)");
		}

		return password;
	}
}