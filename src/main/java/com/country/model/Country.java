package com.country.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Country")
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

	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	 private long id;
	
	@Column(name="countryName")
	 private String countryName;
	
	@Column(name="population")
	 private long population;
	 
	@Column(name="latitude")
	 private double latitude;
	
	@Column(name="longitude")
	 private double longitude;
	public long getId() {
		return id;
	}
	public void setId(long id) {
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
