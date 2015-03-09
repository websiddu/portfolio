"use strict"
angular.module("websidduApp").controller "projectCtrl", ($scope, Project, project, $routeParams, $rootScope, $location, $http, constants) ->
  $scope.project = project
  $scope.style =
    background: "transparent url('"+ $scope.project.banner + "') center no-repeat"
    "background-size": "cover"

  date = new Date(project.date)
  months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
  $scope.date = months[date.getMonth()] + " " + date.getFullYear()

  $scope.images = []

  $scope.isVoted = false
  $scope.votes = 0


  localStorage[$location.path()] = 'seen'

  $scope.init = ->
    _getImagesInProject()
    _initSticky()
    $scope.votes = angular.copy(project.votes)
    _setIsVoted()
    _initKeyboardShortCuts()

  _initKeyboardShortCuts = ->
    window.addEventListener("keyup", _checkKeyPressed, false)

  _checkKeyPressed = (e) ->
    k = e.keyCode
    if k is 39
      $location.path("/projects/#{project.nextProject.project._id.$oid}")
    if k is 37
      $location.path("/projects/#{project.previousProject.project._id.$oid}")

  _setIsVoted = ->
    if localStorage["voted_#{$routeParams.projectId}"] is "true"
      $scope.isVoted = true

  $scope.voteUp = ->
    return if $scope.isVoted is true
    $http
      url: "#{constants.base_url}api/vote/#{$routeParams.projectId}"
      method: 'POST'
    .success (data) ->
        localStorage["voted_#{$routeParams.projectId}"] = true
        $scope.isVoted = true
        $scope.project.votes = data

  _initSticky = ->
    setTimeout ->
      nav = document.getElementById('prj-title')
      sticky(nav, 73)
    , 10

  _getImagesInProject = ->
    setTimeout ->
      $images = $('.project-show-description .section-body img')
      $images.each (imgA) ->
        $img = $(this)
        $("<img/>").attr("src", $img.attr("src"))
          .load(() ->
            img =
              src: $img.attr('src')
              w: this.width
              h: this.height
              title: $img.attr('alt')
            $scope.images.push(img)
            if imgA is $images.length - 1
              _initPhotoSwipe()
          )
    , 100

    return

  _initPhotoSwipe = ->
    setTimeout ->
      pswpElement = document.querySelectorAll(".pswp")[0]
      items = angular.copy($scope.images)

      $('.project-show-description .section-body').on 'click', 'img', ->
        options =
          index: ($('.project-show-description  .section-body img').index(this))
          history: false
          closeOnScroll: false
          showHideOpacity: true
          hideAnimationDuration: 500
          showAnimationDuration: 500
          getThumbBoundsFn: (index) ->
            thumbnail = document.querySelectorAll(".project-show-description .section-body img")[index]
            pageYScroll = window.pageYOffset or document.documentElement.scrollTop
            rect = thumbnail.getBoundingClientRect()
            x: rect.left
            y: rect.top + pageYScroll
            w: rect.width

        gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, angular.copy(items), options)
        gallery.init()
    , 10

  $(document).one "click", ".scrSht", (e) ->
    e.preventDefault()
    s = $('.scrSht').magnificPopup(
      type: 'image'
      gallery:
        enabled: true
      zoom:
        enabled: true
        duration: 300
    ).magnificPopup('open')

  $scope.init()
