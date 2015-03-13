"use strict"
angular.module("websidduApp").controller "designsCtrl", ($scope, $routeParams, $rootScope, designs) ->
  $scope.arts = designs

  $scope.prettyDate = (date) ->
    dateObj = new Date(date)
    format = d3.time.format("%B %d, %Y");
    format(dateObj)

angular.module("websidduApp").controller "designCtrl", ($scope, $routeParams, $rootScope, Design, design) ->
  $scope.art = design
  $('.fullscreen, .fullscreen-img').on "click", ->
    if screenfull.enabled
      screenfull.toggle($('.fullscreen-img')[0])
