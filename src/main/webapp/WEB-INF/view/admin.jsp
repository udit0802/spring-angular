<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>



<script
	src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.4/angular.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 <link rel="stylesheet"
	href="<c:url value="/resources/css/app.css" ></c:url>" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-bootstrap/2.5.0/ui-bootstrap.js"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/base.js" ></c:url>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/app.js" ></c:url>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/services.js" ></c:url>"></script>

<title>AngularJS $http Rest example</title>

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
	
	<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>
	
	<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
        <p>Some text in the modal.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
</body>
</html>