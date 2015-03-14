"use strict"
angular.module("websidduApp").controller "appCtrl", ($scope, $rootScope, $location, $anchorScroll, ngProgress, constants, Project, $timeout) ->


  # colors = ["#76a7fa", "#e46f61", "#4dbfd9", "#fbcb43", "#8cc474", "#bc5679", "#6f85bf", "#f9b256"]

  progressBar = ngProgress

  progressBar.color("#76a7fa")

  $rootScope.$on "$routeChangeStart",  (event, next, current) ->
    rand = Math.floor((Math.random()*8)+1)
    $rootScope.rand = rand
    progressBar.start()

  $rootScope.$on "$routeChangeSuccess", (event, current, previous) ->
    progressBar.complete()
    progressBar.stop()
    if current.templateUrl is "views/project.html"
      $anchorScroll()

  $rootScope.$on "$routeChangeError", (event, current, previous) ->
    progressBar.complete()
    progressBar.stop()

  $rootScope.getClass = (path) ->
    if $location.path().substr(0, path.length) is path then "active" else ""

  $rootScope.data = constants.data

  $scope.closeNavbarInMobile = (path) ->
    $location.path(path)
    $timeout ->
      if $('.top-bar').hasClass('expanded')
        $('.toggle-topbar').click()
    , 10

angular.module("websidduApp").controller "404Ctrl", ($scope, $rootScope, $location) ->
