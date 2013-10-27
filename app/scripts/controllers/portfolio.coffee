"use strict"
angular.module("websidduApp").controller "portfolioCtrl", ($scope, Project) ->
  console.log "Porject controller :) "
  $scope.projects = Project.query()
  console.log $scope.projects
