package com.wetried.bucketlist.entities;

import javax.persistence.Entity;

@Entity
public class User {
	
	private int id;
	private String username;
	private String password;
	private String email;
	private String role;
	
	public User() {
		super();
	}

	public User(String username, String password, String email, String role) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.role = role;
	}
	
}
