"use strict"
angular.module("websidduApp").controller "MainCtrl", ($scope, $rootScope, $location, projects, parallaxHelper, $timeout) ->
  _desingAvatar = $('.js_avatar_design')
  _defaultAvatar = $('.js_default_trigger')
  _codeAvatar = $('.js_avatar_code')

  $scope.projects = projects
  $scope.selectedSize = ""
  $scope.sortedBy = "-date"

  $scope.projectThumb = (img) ->
    "background-image": "url(#{img})"

  $(window).on('mousewheel', (event) ->
    return if $location.path() != '/'
    if $(window).scrollTop() + $(window).height() is $(document).height()
      $location.path('/portfolio')
    return
  )

  # $scope.background = parallaxHelper.createAnimator(-0.2);

  # $(".l-design").hover (->
  #   _defaultAvatar.removeClass("flipInX").addClass('hide')
  #   _desingAvatar.removeClass('hide flipOutX').addClass("flipInX")
  # ), ->
  #   _defaultAvatar.addClass("flipInX").removeClass('flipOutX hide')
  #   _desingAvatar.removeClass('flipOutX').addClass('hide')

  # $(".l-code").hover (->
  #   _defaultAvatar.removeClass("flipInX").addClass('hide')
  #   _codeAvatar.removeClass('hide flipOutX').addClass("flipInX")
  # ), ->
  #   _defaultAvatar.addClass("flipInX").removeClass('flipOutX hide')
  #   _codeAvatar.removeClass('flipOutX').addClass('hide')
