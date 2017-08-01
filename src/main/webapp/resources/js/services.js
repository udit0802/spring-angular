app.factory("Markers", function(){
  var Markers = [
    {
      "id": "0",
      "coords": {
        "latitude": "45.5200",
        "longitude": "-122.6819"
      },
      "window": {
        "title": "Portland, OR"
      }
    },
    {
      "id": "1",
      "coords": {
        "latitude": "40.7903",
        "longitude": "-73.9597"
      },
      "window" : {
        "title": "Manhattan New York, NY"
      }
    }
  ];
  return Markers;
});

app.factory('modalFactory', function($uibModal) {
  return {
    open: function(size, template,data) {
      return $uibModal.open({
        animation: true,
        templateUrl: template || 'myModalContent.html',
        controller: 'ModalResultInstanceCtrl',
        size: size,
				scope:data
      });
    }
  };
});

app.controller('ModalResultInstanceCtrl',['$scope', '$uibModalInstance', function($scope, $uibModalInstance) {
	$scope.cancel = function() {
	  $uibModalInstance.dismiss('cancel');
	};
}]);

app.factory('requestService',['$http','$q',function($http,$q){
	// params = {'method':'GET/POST','url':'URL FOR REQUEST','data':'OBJECT OF VALUES','addHeaders':'TRUE/FALSE'}
	return function(params) {
		// Local Objects
		var p_defered = $q.defer();
        var p_request;

        // Fill Request Parameters
        p_request = $http({
            method : params.method,
            url: params.url,
            data: params.data
        });
        // Make Request
        p_request
            .then(function(response) {
                p_defered.resolve(response);
        	},function(rejection) {
                p_defered.reject(rejection);
            });
        return p_defered.promise;
        // Returns Promise
    };    
}]);