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
}])