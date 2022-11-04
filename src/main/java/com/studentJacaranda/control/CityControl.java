package com.studentJacaranda.control;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.studentJacaranda.model.City;

public class CityControl {

	public static City getCity(int id) {

		Session session = ConnectionBD.getSession();
		City city = (City) session.get(City.class, id);
		return city;
	}

	public static boolean saveCity(City city) throws DaoException {
		boolean resultado = false;
		Session session = ConnectionBD.getSession();

		try {
			session.getTransaction().begin();
			session.saveOrUpdate(city);
			session.getTransaction().commit();
			resultado = true;

		} catch (Exception e) {
			throw new DaoException(e.getMessage());
		}
		return resultado;
	}

	
	public static boolean deleteCity(City city) throws DaoException {
		boolean resultado = false;
		Session session = ConnectionBD.getSession();

		try {
			session.getTransaction().begin();
			session.delete(city);
			session.getTransaction().commit();
			resultado = true;

		} catch (Exception e) {
			throw new DaoException(e.getMessage());
		}
		return resultado;
	}

	public static ArrayList<City> getCities() {
		Session session = ConnectionBD.getSession();
		
		Query<City> query = session.createQuery("SELECT p FROM com.studentJacaranda.model.City p");
		ArrayList<City> cities = (ArrayList<City>) query.getResultList();
		
		return cities;

	}
}
