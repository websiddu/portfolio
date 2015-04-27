"use strict"
angular.module("websidduApp").controller "projectCtrl", ($scope, Project, project, $routeParams, $rootScope, $location, $http, constants, hotkeys) ->
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
    _initHotKeys()

  _initHotKeys = ->
    hotkeys.del('right')
    hotkeys.del('left')
    hotkeys.bindTo($scope)
      .add
        combo: 'right',
        description: 'Move to next project',
        callback: ->
          if project.nextProject and $(".pswp").attr('aria-hidden') is "true"
            $location.path("/projects/#{project.nextProject.project._id.$oid}")

      .add
        combo: 'left',
        description: 'Move to previous project',
        callback: ->
          if project.previousProject and $(".pswp").attr('aria-hidden') is "true"
            $location.path("/projects/#{project.previousProject.project._id.$oid}")

  _setIsVoted = ->
    if localStorage["voted_#{$routeParams.projectId}"] is "true"
      $scope.isVoted = true

  $scope.voteUp = ->
    return if $scope.isVoted is true
    $http
      url: "#{constants.base_url}api/projects/#{$routeParams.projectId}/vote"
      method: 'POST'
    .success (data) ->
        localStorage["voted_#{$routeParams.projectId}"] = true
        $scope.isVoted = true
        $scope.project.votes = data

  _initSticky = ->
    setTimeout ->
      nav = document.getElementById('prj-title')
      sticky(nav, 73)
    , 1000

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

  $scope.init()
