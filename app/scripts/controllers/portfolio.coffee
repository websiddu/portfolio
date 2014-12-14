"use strict"
angular.module("websidduApp").controller "portfolioCtrl", ($scope, $rootScope, projects, $timeout) ->
  $scope.projects = projects
  $scope.selectedSize = ""
  $scope.sortedBy = "-date"

  $scope.projectThumb = (img) ->
    "background-image": "url(#{img})"

  $timeout ->
    window.sr = new scrollReveal();
  , 10

  $scope.projectSeen = (prj) ->
    localStorage[prj]

