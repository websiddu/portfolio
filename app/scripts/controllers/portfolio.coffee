"use strict"
angular.module("websidduApp").controller "portfolioCtrl", ($scope, $rootScope, Project) ->
  $scope.projects = Project.query()
