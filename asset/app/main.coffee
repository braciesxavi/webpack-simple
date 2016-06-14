'use strict'
require("!style!css!../styles/css/style.css");
require('angular');
require('angular-ui-router/release/angular-ui-router');
require('oclazyload/dist/ocLazyLoad')
app = angular.module('webpackModule',[
	'ui.router'
	'oc.lazyLoad'
])
app.config [
  '$stateProvider'
  '$locationProvider'
  '$urlRouterProvider'
  ($stateProvider, $locationProvider, $urlRouterProvider) ->
    $stateProvider
    .state('home',
      url: '/home'
      template: require('./views/home.html')
      controller: 'homeController'
      resolve: [
        '$q'
        '$ocLazyLoad'
        ($q, $ocLazyLoad) ->
          deferred = $q.defer()
          require.ensure [], (require) ->
            mod = require('./controllers/homeController.coffee')
            $ocLazyLoad.load name: mod.name
            deferred.resolve mod.controller
            return
          deferred.promise
      ])
    .state 'user',
      url: '/user'
      template: require('./views/user.html')
      controller: 'userController'
      resolve: [
        '$q'
        '$ocLazyLoad'
        ($q, $ocLazyLoad) ->
          deferred = $q.defer()
          require.ensure [], (require) ->
            mod = require('./controllers/userController.coffee')
            $ocLazyLoad.load name: mod.name
            deferred.resolve mod.controller
            return
          deferred.promise
      ]
    $locationProvider.html5Mode true
    $urlRouterProvider.otherwise '/home'
    return
]

