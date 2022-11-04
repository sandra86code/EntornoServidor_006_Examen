package com.studentJacaranda.control;

import java.util.List;
import org.hibernate.Session;
import com.studentJacaranda.model.User;


public class DaoUser {
	
	

	public DaoUser() {
		
	}
	
	
	
	public User getUser(String name) throws DaoException {
		Session session = ConnectionBD.getSession();
		User result = (User)session.get(User.class, name);
		if(result == null) {
			throw new DaoException("No se ha encontrado el usuario");
		}
		return result;
	}
	
	public boolean isUserValid(String name, String password) throws DaoException {
		boolean result = false;
		if(name==null || password==null) {
			throw new DaoException("Datos nulos.");
		}
		User user;
		try {
			user = getUser(name);
			if(user.getPassword().equals(password)) {
				result = true;
			}
		} catch (DaoException e) {
			throw new DaoException(e.getMessage());
		}
		return result;
	}
}

