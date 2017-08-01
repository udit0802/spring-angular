
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
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDF3S_BJx6d0_JWt-kMPzdllMSHxrFVJKU&libraries=places,drawing">
                                                                               
                                                                </script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/2.4.1/lodash.js"></script>
<script src="http://rawgit.com/angular-ui/angular-google-maps/2.0.X/dist/angular-google-maps.js"></script>
 

<script type="text/javascript" src="<c:url value="/resources/js/base.js" ></c:url>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/app.js" ></c:url>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/map.js" ></c:url>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/services.js" ></c:url>"></script>
</head>
<body ng-app="CountryManagement" ng-controller="gMap" >
<div>
<a href = "<c:url value="/admin"></c:url>">Back to Admin Page!!</a>

<select ng-model="initialselected" ng-options="marker.window.title for marker in markers" ng-change="changefirst()">
<option value="">Select Initial Point</option>
<!-- <option value="{{marker}}" ng-repeat="marker in markers">{{marker.window.title}}</option> -->
  </select>
<!-- <select ng-model="finalselected" ng-change="change()">
<option value="">Select Final Point</option>
<option value="{{marker}}" ng-repeat="marker in markers" ng-if="marker.window.title != initialselected.window.title">{{marker.window.title}}</option>
  </select> -->
<select ng-model="finalselected" ng-disabled="!initialselected" ng-change="change()" ng-options="marker.window.title for marker in secondList">
<option value="">Select Final Point</option>
  </select>
<!-- <my-map-directive/> -->
  <ui-gmap-google-map 
  	
    center='map.center' 
    zoom='map.zoom' aria-label="Google map">
    
    <ui-gmap-polyline ng-repeat="p in polyline" path="p.path" stroke="p.stroke" visible="p.visible"
        geodesic="p.geodesic" editable="p.editable" draggable="p.draggable" static="true" >
        </ui-gmap-polyline>
    
    <ui-gmap-marker  ng-repeat="marker in markers"
      coords="marker.coords" options="marker.options" events="marker.events" idkey="marker.id">
      
      <ui-gmap-window>
      
        <div>
        	<div>CountryName : {{marker.window.title}}</div>
        	<div>Population : {{marker.window.population}}</div>
        </div>
      </ui-gmap-window>
    </ui-gmap-marker>
    
  </ui-gmap-google-map>
</div>
</body>
</html>