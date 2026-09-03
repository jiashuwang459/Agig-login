package com.agig;

public class DuplicateUserException extends Exception {

	private static final long serialVersionUID = -2003928794773251307L;

	public DuplicateUserException() {
		super("Username or email already exists");
	}
}
