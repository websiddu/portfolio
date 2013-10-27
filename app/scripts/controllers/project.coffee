"use strict"
angular.module("websidduApp").controller "projectCtrl", ($scope, Project, $routeParams) ->
  $scope.project = Project.get(
    id: $routeParams.projectId
    )
