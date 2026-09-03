package com.agig.validation;

public class ValidationException extends Exception {

	private static final long serialVersionUID = 4350381210799301970L;

	private final String field;

	public ValidationException(String field, String message) {
		super(message);
		this.field = field;
	}

	public String getField() {
		return field;
	}
}