             //Controller Part
            app.controller("adminCtrl", function($scope, $http) {
     
               
                $scope.countries = [];
                $scope.countryForm = {
                    id : -1,
                    countryName : "",
                    population : "",
                    latitude : 73.1434523,
                    longitude : 20.3864233
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
                    $scope.countryForm.latitude = country.latitude;
                    $scope.countryForm.longitude = country.longitude;
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
                    _clearFormData();
                    $("#myModal").toggle();
                	$('.modal-backdrop').hide();
                }
         
                function _error(response) {
                    console.log(response.statusText);
                }
         
                //Clear the form
                function _clearFormData() {
                    $scope.countryForm.id = -1;
                    $scope.countryForm.countryName = "";
                    $scope.countryForm.population = "";
                    $scope.countryForm.latitude = 73.1434523;
                    $scope.countryForm.longitude = 20.3864233;
                
                };
                
                $scope.cancel = function(){
                	$("#myModal").toggle();
                	$('.modal-backdrop').hide();
                }
            });