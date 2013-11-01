"use strict"
angular.module("websidduApp").controller "appCtrl", ($scope, $rootScope, $location) ->
  $rootScope.$on "$routeChangeStart", (event, next, current) ->
    $rootScope.rand = Math.floor((Math.random()*8)+1)

angular.module("websidduApp").controller "404Ctrl", ($scope, $rootScope, $location) ->
