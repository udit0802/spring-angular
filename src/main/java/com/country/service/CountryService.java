package com.country.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.country.model.Country;

public class CountryService {

	static HashMap<Integer,Country> countryIdMap=getCountryIdMap();


	 public CountryService() {
	  super();

	  if(countryIdMap==null)
	  {
	   countryIdMap=new HashMap<Integer,Country>();
	  // Creating some objects of Country while initializing
	   Country indiaCountry=new Country(1, "India",10000,20.5937,78.9629);
	   Country chinaCountry=new Country(4, "China",20000,35.8617,104.1954);
	   Country nepalCountry=new Country(3, "Nepal",8000,28.3949,84.1240);
	   Country bhutanCountry=new Country(2, "Bhutan",7000,27.5142,90.4336);


	   countryIdMap.put(1,indiaCountry);
	   countryIdMap.put(4,chinaCountry);
	   countryIdMap.put(3,nepalCountry);
	   countryIdMap.put(2,bhutanCountry);
	  }
	 }

	 public List getAllCountries()
	 {
	  List countries = new ArrayList(countryIdMap.values());
	  return countries;
	 }

	 public Country getCountry(int id)
	 {
	  Country country= countryIdMap.get(id);
	  return country;
	 }
	 public Country addCountry(Country country)
	 {
	  country.setId(getMaxId()+1);
	  countryIdMap.put(country.getId(), country);
	  return country;
	 }
	 
	 public Country updateCountry(Country country)
	 {
	  if(country.getId()<=0)
	   return null;
	  countryIdMap.put(country.getId(), country);
	  return country;

	 }
	 public void deleteCountry(int id)
	 {
	  countryIdMap.remove(id);
	 }

	 public static HashMap<Integer, Country> getCountryIdMap() {
	  return countryIdMap;
	 }
	 

	 // Utility method to get max id
	 public static int getMaxId()
	 {   int max=0;
	 for (int id:countryIdMap.keySet()) {  
	  if(max<=id)
	   max=id;

	 }  
	 return max;
	 }
}
