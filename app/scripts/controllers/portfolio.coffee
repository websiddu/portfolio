"use strict"
angular.module("websidduApp").controller "portfolioCtrl", ($scope, $rootScope, projects, $timeout) ->
  $scope.projects = projects
  $scope.selectedSize = ""
  $scope.sortedBy = "-date"

  $scope.projectThumb = (img) ->
    "background-image": "url(#{img})"

  $scope.getWidth = (project) ->
    if project.size is 'large'
      return '50%'
    if project.size is 'medium'
      return '37.5%'
    if project.size is 'small'
      return '25%'
    if project.size is 'mini'
      return '5%'

  $scope.getFlexGrow = (project) ->
    if project.size is 'large'
      return '105'
    if project.size is 'medium'
      return '50'
    if project.size is 'small'
      return '10'
    if project.size is 'mini'
      return '0'

  $timeout ->
    window.sr = new scrollReveal();
  , 10

  $scope.projectSeen = (prj) ->
    localStorage[prj]

