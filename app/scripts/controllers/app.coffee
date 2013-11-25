"use strict"
angular.module("websidduApp").controller "appCtrl", ($scope, $rootScope, $location, ngProgress, constants, Project) ->


  # colors = ["#76a7fa", "#e46f61", "#4dbfd9", "#fbcb43", "#8cc474", "#bc5679", "#6f85bf", "#f9b256"]

  progressBar = ngProgress

  $rootScope.$on "$routeChangeStart", (event, next, current) ->
    rand = Math.floor((Math.random()*8)+1)
    $rootScope.rand = rand

  progressBar.color("#76a7fa")

  $rootScope.$on "$routeChangeStart",  (event, next, current) ->
    progressBar.start()

  $rootScope.$on "$routeChangeSuccess", (event, current, previous) ->
    progressBar.complete()
    progressBar.stop()

  $rootScope.$on "$routeChangeError", (event, current, previous) ->
    progressBar.complete()
    progressBar.stop()

  $rootScope.data = constants.data
  projects = Project.query()

angular.module("websidduApp").controller "404Ctrl", ($scope, $rootScope, $location) ->
