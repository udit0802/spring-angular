package com.country.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.country.model.Country;
import com.country.service.CountryService;

@RestController
public class CountryController {

	@Autowired
	CountryService countryService = new CountryService();
	
	@RequestMapping(value = "/countries", method = RequestMethod.GET)
	 public List<Country> getCountries() {
	  List<Country> listOfCountries = countryService.getAllCountries();
	  return listOfCountries;
	 }
	 
	 @RequestMapping(value = "/country/{id}", method = RequestMethod.GET)
	 public Country getCountryById(@PathVariable int id) {
	  return countryService.getCountry(id);
	 }
	 
	 @RequestMapping(value = "/countries", method = RequestMethod.POST)
	 public Country addCountry(@RequestBody Country country) {
	  return countryService.addCountry(country);
	 }
	 
	 @RequestMapping(value = "/countries", method = RequestMethod.PUT)
	 public Country updateCountry(@RequestBody Country country) {
	  return countryService.updateCountry(country);
	 
	 }
	 
	 @RequestMapping(value = "/country/{id}", method = RequestMethod.DELETE)
	 public void deleteCountry(@PathVariable("id") int id) {
	  countryService.deleteCountry(id);
	 
	 } 
}
