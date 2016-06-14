
ctrl = angular.module('home', []);

ctrl.controller('homeController', ['$scope', ($scope)->
	console.log('Home controller running');
])

module.exports = ctrl