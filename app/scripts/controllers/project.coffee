"use strict"
angular.module("websidduApp").controller "projectCtrl", ($scope, Project, project, $routeParams, $rootScope) ->

  $scope.project = project
  # $rootScope.rand = Math.floor((Math.random()*8)+1)

  $rootScope.$on "$routeChangeError", (event, current, previous, rejection) ->
    alert "ROUTE CHANGE ERROR: " + rejection
