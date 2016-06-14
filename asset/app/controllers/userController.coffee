
ctrl = angular.module('user', []);

ctrl.controller('userController', ['$scope', ($scope)->
	console.log('User controller running');
])

module.exports = ctrl