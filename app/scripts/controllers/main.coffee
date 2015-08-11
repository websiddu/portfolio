"use strict"
angular.module("websidduApp").controller "MainCtrl", ($scope, $rootScope, $location, $timeout, constants, $http, projects) ->

  $scope.projectThumb = (img) ->
    "background-image": "url(#{img})"

  $scope.projects = projects
  $scope.showCard = false

  typed = null
  sentence = [
    "Hello, I am Sid..."
    # "I'm a UX Designer and Front-end Engineer..."
    # "Hello, I am Sid..."
    # "I love designing and building usable products..."
    # "Now in Hindi..."
    "Hallo, ich bin sid..."
    "नमस्ते, मैं सिद्धार्थ हूँ..."
    # "Now in Telugu..."
    "నమస్తే, నేను సిద్ధార్థ..."
    # "Now in Chinese..."
    "您好，我是悉达多..."
    "வணக்கம், என் பெயர் சித்தார்த்தா..."
    # "Done... replaying..."
  ]

  $scope.toogleCardShow = ($event) ->
    if $($event.target).hasClass('js-full-stack-card')
      $scope.showCard = true

  $scope.toogleCardShowHide = ($event) ->
    if $($event.target).hasClass('js-full-stack-card')
      $scope.showCard = false

  $scope.init = ->
    # _loadChart()
    #_initTyped()
    #_bindMouseWeel()


  _initTyped = ->
    $timeout ->
      if typed
        $('.l-n .text').typed('reset')
      typed = $('.l-n .text').typed
        strings: sentence
        typeSpeed: 80
        backDelay: 4000
        loop: true
        # loopCount: 3

    , 100

  _bindMouseWeel = ->
    $(window).on('mousewheel', (event) ->
      return if $location.path() != '/'
      if $(window).scrollTop() + $(window).height() is $(document).height()
        $location.path('/portfolio')
      return
    )



  $scope.init()
