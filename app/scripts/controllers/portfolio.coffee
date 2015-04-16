"use strict"
__savedClickedIndex = -1;
angular.module("websidduApp").controller "portfolioCtrl", ($scope, $rootScope, projects, $timeout) ->
  $scope.projects = projects
  $scope.selectedSize = ""
  $scope.sortedBy = "-date"
  $scope.clickedIndex = __savedClickedIndex;

  $scope.projectThumb = (img) ->
    "background-image": "url(#{img})"
    "background-repeat": 'no-repeat'


  $scope.changeRoute = (id) ->
    $scope.clickedIndex = id;
    __savedClickedIndex = id;
    setTimeout ->
      location.hash = '#/projects/' + id;
    , 10



  $timeout ->
    window.sr = new scrollReveal();
  , 10

  $scope.projectSeen = (prj) ->
    localStorage[prj]

