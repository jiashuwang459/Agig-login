package com.agig;

public class User {
	private final String username;
	private final String firstName;
	private final String lastName;
	private final String email;
	private final String displayName;

	public User(String username, String firstName, String lastName, String email) {

		this.username = username;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.displayName = "%s %s".formatted(firstName, lastName);
	}

	public String getUsername() {
		return username;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getEmail() {
		return email;
	}
	
	public String getDisplayName() {
		return displayName;
	}
}
