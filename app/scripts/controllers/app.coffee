"use strict"
angular.module("websidduApp").controller "appCtrl", ($scope, $rootScope, $location, $anchorScroll, ngProgressFactory, constants, Project, $timeout, $route, hotkeys) ->


  # colors = ["#76a7fa", "#e46f61", "#4dbfd9", "#fbcb43", "#8cc474", "#bc5679", "#6f85bf", "#f9b256"]

  $rootScope.colors = [
    {
      logo: ['#D35950', '#E46F61']
      border: '#D35950'
    }
    {
      logo: ['#5182BC', '#5D8FCA']
      border: '#5182BC'
    }
    {
      logo: ['#DBA628', '#EFBB37']
      border: '#DBA628'
    }
    {
      logo: ['#67AA48', '#84BC69']
      border: '#67AA48'
    }
    {
      logo: ['#AF456E', '#BC5679']
      border: '#AF456E'
    }
    {
      logo: ['#5069A3', '#6F85BF']
      border: '#5069A3'
    }
    {
      logo: ['#35A7BA', '#4DBFD9']
      border: '#35A7BA'
    }
    {
      logo: ['#773D99', '#8D50AA']
      border: '#773D99'
    }
  ]

  initHotkeys = ->
    hotkeys.bindTo($scope)
      .add
        combo: 'c h a t',
        description: 'Chat with Sid',
        callback: ->
          window.open('http://chat.websiddu.com', '_blank');


  $scope.gotoMain = ->
    $location.hash('start-of-content')
    $anchorScroll()


  $rootScope.getClass = (path) ->
    if $location.path().substr(0, path.length) is path then "active" else ""

  $rootScope.data = constants.data

  $scope.closeNavbarInMobile = (path) ->
    $location.path(path)
    $timeout ->
      if $('.top-bar').hasClass('expanded')
        $('.toggle-topbar').click()
    , 10

  initHotkeys()

angular.module("websidduApp").controller "404Ctrl", ($scope, $rootScope, $location) ->
