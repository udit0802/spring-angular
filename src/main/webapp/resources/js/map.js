app.controller("gMap",['$scope','$http',function($scope,$http){
  
  $scope.map = { 
    center: { latitude: 34.0479, longitude: 100.6197 }, 
    zoom: 4 
  };
//  $scope.countries = [];
//  $scope.markers = Markers;
 
  $scope.markers=[];
  $scope.secondList = [];
  $scope.polyline = [];
  _refreshCountryData();
  function _refreshCountryData() {
      $http({
          method : 'GET',
          url : 'http://localhost:7001/CountryCrud/countries'
      }).then(function successCallback(response) {
          var countries = response.data;
          for(var i=0;i<countries.length;i++){
        	  var lat = countries[i].latitude;
        	  console.log("lat = " + lat);
        	 
        		  
        	  	
        	  $scope.markers.push({
        		     "id": i,
        			  "coords": {
        			        "latitude": countries[i].latitude.toString(),
        			        "longitude": countries[i].longitude.toString()
        			      },
        			      "window": {
        			        "title": countries[i].countryName.toString(),
        			        "population": countries[i].population.toString()
        			      } 
        	  });
          }
          
          
         
          console.log($scope.markers[0].coords);
      }, function errorCallback(response) {
          console.log(response.statusText);
      });
  }
  
  $scope.changefirst = function(){
	  $scope.secondList = [];
	  var markers = $scope.markers;
	  for(var i = 0;i<markers.length;i++){
		  if($scope.initialselected != undefined && $scope.initialselected.window.title != markers[i].window.title){
			  $scope.secondList.push(markers[i]);
		  }
	  }
	  _drawpolyline();
  }
  
  $scope.change = function(){
	  _drawpolyline();
  }
  
  function _drawpolyline(){
	  $scope.polyline = [];
	  if($scope.finalselected != undefined && $scope.initialselected != undefined){
	  $scope.polyline.push({
			  "id": 1,
			    "path": [
			      {
			        "latitude": $scope.initialselected.coords.latitude,
			        "longitude": $scope.initialselected.coords.longitude
			      },
			      {
			        "latitude": $scope.finalselected.coords.latitude,
			        "longitude": $scope.finalselected.coords.longitude
			      }
			    ],
			    "stroke": {
			      "color": "#6060FB",
			      "weight": 3
			    },
			    "editable": false,
			    "draggable": false,
			    "geodesic": true,
			    "visible": true
	  });
	  }
  }
}]);
