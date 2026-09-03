package com.agig;

import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;

public class PasswordHasher {

	// https://cheatsheetseries.owasp.org/cheatsheets/Password_Storage_Cheat_Sheet.html
	// OWASP recommends to use Argon2id with a minimum configuration of 19 MiB of
	// memory, an iteration count of 2, and 1 degree of parallelism.

	private static final int ITERATIONS = 2;
	private static final int MEMORY_KIB = 19 * 1024;
	private static final int PARALLELISM = 1;

	private final Argon2 argon2;

	public PasswordHasher() {
		this.argon2 = Argon2Factory.create(Argon2Factory.Argon2Types.ARGON2id);
	}

	public String hash(String password) {
		char[] passwordChars = password.toCharArray();

		try {
			return argon2.hash(ITERATIONS, MEMORY_KIB, PARALLELISM, passwordChars);
		} finally {
			argon2.wipeArray(passwordChars);
		}
	}

	public boolean verify(String password, String hash) {
		char[] passwordChars = password.toCharArray();

		try {
			return argon2.verify(hash, passwordChars);
		} finally {
			argon2.wipeArray(passwordChars);
		}
	}
}
