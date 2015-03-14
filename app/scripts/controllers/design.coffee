"use strict"
angular.module("websidduApp").controller "designsCtrl", ($scope, $routeParams, $rootScope, designs) ->
  $scope.arts = designs

  $scope.prettyDate = (date) ->
    dateObj = new Date(date)
    format = d3.time.format("%B %d, %Y");
    format(dateObj)

angular.module("websidduApp").controller "designCtrl", ($scope, $routeParams, $http, $rootScope, design, constants, hotkeys, $location) ->
  $scope.art = design
  $scope.randArts = null

  $scope.prettyDate = (date) ->
    dateObj = new Date(date)
    format = d3.time.format("%B %d, %Y");
    format(dateObj)

  $scope.init = ->
    _setIsVoted()
    _initHotKeys()
    _getRand()

  _setIsVoted = ->
    if localStorage["voted_a_#{$routeParams.designId}"] is "true"
      $scope.isVoted = true

  _initHotKeys = ->
    hotkeys.del('right')
    hotkeys.del('left')
    hotkeys.bindTo($scope)
      .add
        combo: 'right',
        description: 'Move to next desgin',
        callback: ->
          if design.nextArt
            $location.path("/designs/#{design.nextArt.art._id.$oid}")
      .add
        combo: 'left',
        description: 'Move to previous design',
        callback: ->
          if design.previousArt
            $location.path("/designs/#{design.previousArt.art._id.$oid}")

  _getRand = ->
    $http
      url: "#{constants.base_url}api/arts/?rand=4"
      method: 'GET'
    .success (data) ->
      $scope.randArts = data

  $scope.voteUp = ->
    return if $scope.isVoted is true
    $scope.art.votes++;
    $http
      url: "#{constants.base_url}api/arts/#{$routeParams.designId}/vote"
      method: 'POST'
    .success (data) ->
        localStorage["voted_a_#{$routeParams.designId}"] = true
        $scope.isVoted = true
        $scope.art.votes = data

  $scope.init()
