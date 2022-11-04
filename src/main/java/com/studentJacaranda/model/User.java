package com.studentJacaranda.model;

import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.studentJacaranda.model.UserException;


@Entity
@Table(name="user")
public class User {
	@Id 
	private String name;
	private String password;



	public User() {
	}


	public User(String name, String password) throws UserException {
		setName(name);
		setPassword(password);
	}


	public String getName() {
		return name;
	}


	public void setName(String name) throws UserException {	
		if(name == null || name.isBlank()) {
			throw new UserException("El usuario no puede ser nulo");
		} else if(name.length()>20) {
			throw new UserException("El usuario es demasiado largo");
		} else {
			this.name = name;
		}
	}


	public String getPassword() {
		return password;
	}



	public void setPassword(String password) throws UserException {
		if(password == null || password.isBlank()) {
			throw new UserException("El password no puede ser nula");
		}else if(password.length()>10){
			throw new UserException("El password es demasiado larga");
		} else {
			this.password = password;
		}
	}


	@Override
	public int hashCode() {
		return Objects.hash(name);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		return Objects.equals(name, other.name);
	}


	@Override
	public String toString() {
		return "User [name=" + name + ", password=" + password + "]";
	}
	
	
}
