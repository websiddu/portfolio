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

  waypoint = null

  prev = ''
  now = ''

  localStorage[$location.path()] = 'seen'

  $scope.init = ->
    $rootScope.title = "Project – #{project.title}";
    _getImagesInProject()
    _initSticky()
    $scope.votes = angular.copy(project.votes)
    _setIsVoted()
    _initHotKeys()

    #$('.section-heading').waypoint('destroy')

  $rootScope.$on "$routeChangeStart",  (event, next, current) ->
    Waypoint.destroyAll()

  _initWayPoints = ->
    setTimeout ->
      waypoint = $('.section-heading').waypoint
        handler: (d) ->
          if $(this.element).index($('.section-heading')) is 0
            prev = ''
            now = ''
          if d is 'down'
            now = "– " + $(this.element).text()
            prev = $('.project-page-heading-sec').text()
            $('.project-page-heading-sec').text(now)
          else if d is 'up'
            now = "– " + $(this.element).text()
            $('.project-page-heading-sec').text(prev)
        offset: 95
    , 10


  _initHotKeys = ->
    hotkeys.del('right')
    hotkeys.del('left')
    hotkeys.bindTo($scope)
      .add
        combo: 'right',
        description: 'Move to next project',
        callback: ->
          if project.nextProject and $(".pswp").attr('aria-hidden') is "true"
            $location.path("/projects/#{project.nextProject._id.$oid}")

      .add
        combo: 'left',
        description: 'Move to previous project',
        callback: ->
          if project.previousProject and $(".pswp").attr('aria-hidden') is "true"
            $location.path("/projects/#{project.previousProject._id.$oid}")

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
      if $images.length > 0
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
                _initWayPoints()
            )
      else
        _initWayPoints()

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
