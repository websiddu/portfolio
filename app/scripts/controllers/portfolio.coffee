"use strict"
angular.module("websidduApp").controller "portfolioCtrl", ($scope, $rootScope, projects) ->
  $scope.projects = projects
  $scope.selectedSize = ""
  $scope.sortedBy = "-date"

  $scope.projectThumb = (img) ->
    "background-image": "url(#{img})"
