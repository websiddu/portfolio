"use strict"
angular.module("websidduApp").controller "designCtrl", ($scope, $routeParams, $rootScope, Design) ->
  $scope.arts = Design.query()
  $scope.art = Design.get({id: $routeParams.designId })
