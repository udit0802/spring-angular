package com.country.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.country.dao.CountryDAO;
import com.country.model.Country;

public class CountryDAOImpl implements CountryDAO {
	
	private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

	@Override
	public Country save(Country c) {
		Session session = this.sessionFactory.openSession();
		Transaction tx1 = session.beginTransaction();
		Session session1 = sessionFactory.openSession();
		long id1 = (Long) session1.save(c);
		System.out.println("2. Country save called with transaction, id="+id1);
		System.out.println("3. Before committing save transaction");
		tx1.commit();
		session.close();
		return c;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Country> list() {
		Session session = this.sessionFactory.openSession();
		List<Country> countryList = (List<Country>)session.createQuery("From Country").list();
		session.close();
		return countryList;
	}
	
	@Override
	public Country update(Country c){
		Session session = this.sessionFactory.openSession();
		Query query = session.createQuery("update Country set countryName = :countryName, population = :population, latitude = :latitude, longitude = :longitude" +
				" where id = :id");
		query.setParameter("countryName", c.getCountryName());
		query.setParameter("population", c.getPopulation());
		query.setParameter("latitude", c.getLatitude());
		query.setParameter("longitude", c.getLongitude());
		query.setParameter("id", c.getId());
		
		int result = query.executeUpdate();
		session.close();
		System.out.println("number of rows updated = " + result);
		return c;
	}

	@Override
	public void delete(long id) {
		Session session = this.sessionFactory.openSession();
		Query query = session.createQuery("delete from Country where id = :id");
		query.setParameter("id", id);
		int result = query.executeUpdate();
		System.out.println("rows deleted = " + result);
		session.close();
	}

	@Override
	public Country get(long id) {
//		Session session = this.sessionFactory.openSession();
//		Country country = null;
//	      Transaction tx = null;
//	      try{
//	         tx = session.beginTransaction();
//	         country = 
//	                    (Country)session.get(Country.class, id);
//	         tx.commit();
//	      }catch (HibernateException e) {
//	         if (tx!=null) tx.rollback();
//	         e.printStackTrace(); 
//	      }finally {
//	         session.close(); 
//	      }
//	      return country;
		Session session = this.sessionFactory.openSession();
		String hql = "FROM Country C WHERE C.id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id",id);
		List<Country> results = query.list();
		return results.get(0);
	}
	
	

}
