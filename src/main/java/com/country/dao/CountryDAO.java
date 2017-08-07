package com.country.dao;

import java.util.List;

import com.country.model.Country;

public interface CountryDAO {

	public Country save(Country c);
	
	public List<Country> list();
	
	public Country update(Country c);
	
	public void delete(long id);
	
	public Country get(long id);
}
