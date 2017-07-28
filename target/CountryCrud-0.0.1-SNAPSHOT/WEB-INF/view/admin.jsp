<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>



<script
	src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.4/angular.js"></script>
 <link rel="stylesheet"
	href="<c:url value="/resources/css/app.css" ></c:url>" />
<script type="text/javascript"
	src="<c:url value="/resources/js/app.js" ></c:url>"></script>

<title>AngularJS $http Rest example</title>
<!-- <script type="text/javascript">
            var app = angular.module("CountryManagement", []);
         
            //Controller Part
            app.controller("CountryController", function($scope, $http) {
         
               
                $scope.countries = [];
                $scope.countryForm = {
                    id : -1,
                    countryName : "",
                    population : ""
                };
         
                //Now load the data from server
                _refreshCountryData();
         
                //HTTP POST/PUT methods for add/edit country 
                // with the help of id, we are going to find out whether it is put or post operation
                
                $scope.submitCountry = function() {
         
                    var method = "";
                    var url = "";
                    if ($scope.countryForm.id == -1) {
                        //Id is absent in form data, it is create new country operation
                        method = "POST";
                        url = 'http://localhost:7001/CountryCrud/countries';
                    } else {
                        //Id is present in form data, it is edit country operation
                        method = "PUT";
                        url = 'http://localhost:7001/CountryCrud/countries';
                    }
         
                    $http({
                        method : method,
                        url : url,
                        data : angular.toJson($scope.countryForm),
                        headers : {
                            'Content-Type' : 'application/json'
                        }
                    }).then( _success, _error );
                };
         
                //HTTP DELETE- delete country by Id
                $scope.deleteCountry = function(country) {
                    $http({
                        method : 'DELETE',
                        url : 'http://localhost:7001/CountryCrud/country/' + country.id
                    }).then(_success, _error);
                };
 
             // In case of edit, populate form fields and assign form.id with country id
                $scope.editCountry = function(country) {
                  
                    $scope.countryForm.countryName = country.countryName;
                    $scope.countryForm.population = country.population;
                    $scope.countryForm.id = country.id;
                };
         
                /* Private Methods */
                //HTTP GET- get all countries collection
                function _refreshCountryData() {
                    $http({
                        method : 'GET',
                        url : 'http://localhost:7001/CountryCrud/countries'
                    }).then(function successCallback(response) {
                        $scope.countries = response.data;
                    }, function errorCallback(response) {
                        console.log(response.statusText);
                    });
                }
         
                function _success(response) {
                    _refreshCountryData();
                    _clearFormData()
                }
         
                function _error(response) {
                    console.log(response.statusText);
                }
         
                //Clear the form
                function _clearFormData() {
                    $scope.countryForm.id = -1;
                    $scope.countryForm.countryName = "";
                    $scope.countryForm.population = "";
                
                };
            });
        </script> -->
        
      <!-- <style>
.blue-button{
 background: #25A6E1;
 filter: progid: DXImageTransform.Microsoft.gradient( startColorstr='#25A6E1',endColorstr='#188BC0',GradientType=0);
 padding:3px 5px;
 color:#fff;
 font-family:'Helvetica Neue',sans-serif;
 font-size:12px;
 border-radius:2px;
 -moz-border-radius:2px;
 -webkit-border-radius:4px;
 border:1px solid #1A87B9
}     

.red-button{
 background: #CD5C5C;

 padding:3px 5px;
 color:#fff;
 font-family:'Helvetica Neue',sans-serif;
 font-size:12px;
 border-radius:2px;
 -moz-border-radius:2px;
 -webkit-border-radius:4px;
 border:1px solid #CD5C5C
}      

table {
  font-family: "Helvetica Neue", Helvetica, sans-serif;
   width: 50%;
}

caption {
  text-align: left;
  color: silver;
  font-weight: bold;
  text-transform: uppercase;
  padding: 5px;
}

th {
  background: SteelBlue;
  color: white;
}


tbody tr:nth-child(even) {
  background: WhiteSmoke;
}

tbody tr td:nth-child(2) {
  text-align:center;
}

tbody tr td:nth-child(3),
tbody tr td:nth-child(4) {
  text-align: center;
  font-family: monospace;
}

tfoot {
  background: SeaGreen;
  color: white;
  text-align: right;
}

tfoot tr th:last-child {
  font-family: monospace;
}

            td,th{
                border: 1px solid gray;
                width: 25%;
                text-align: left;
                padding: 5px 10px;
            }     
            
        </style> -->
<head>
<body ng-app="CountryManagement" ng-controller="CountryController">
	<h1>AngularJS Restful web services example using $http</h1>
	<form ng-submit="submitCountry()">
		<table>

			<tr>
				<th colspan="2">Add/Edit country</th>
			</tr>
			<tr>
				<td>Country</td>
				<td><input type="text" ng-model="countryForm.countryName" /></td>
			</tr>
			<tr>
				<td>Population</td>
				<td><input type="text" ng-model="countryForm.population" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Submit"
					class="blue-button" /></td>
			</tr>
		</table>
	</form>
	<table>
		<tr>

			<th>CountryName</th>
			<th>Population</th>
			<th>Operations</th>

		</tr>

		<tr ng-repeat="country in countries">

			<td>{{ country.countryName }}</td>
			<td>{{ country.population }}</td>

			<td><a ng-click="editCountry(country)" class="blue-button">Edit</a>
				| <a ng-click="deleteCountry(country)" class="red-button">Delete</a></td>
		</tr>

	</table>
</body>
</html>