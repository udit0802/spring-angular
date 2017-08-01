package com.country.model;

public class Country {
	
	public Country() {
		  super();
		 }
		 public Country(int i, String countryName,long population,double latitude,double longitude) {
		  super();
		  this.id = i;
		  this.countryName = countryName;
		  this.population=population;
		  this.latitude = latitude;
		  this.longitude = longitude;
		 }

	 private int id;
	 private String countryName; 
	 private long population;
	 
	 private double latitude;
	 private double longitude;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public long getPopulation() {
		return population;
	}
	public void setPopulation(long population) {
		this.population = population;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	
}
