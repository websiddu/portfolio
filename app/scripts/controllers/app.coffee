"use strict"
angular.module("websidduApp").controller "appCtrl", ($scope, $rootScope, $location) ->
  $rootScope.$on "$routeChangeStart", (event, next, current) ->
    $rootScope.rand = Math.floor((Math.random()*8)+1)
