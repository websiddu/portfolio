"use strict"
angular.module("websidduApp").controller "projectCtrl", ($scope, Project, project, $routeParams, $rootScope, $location) ->
  $scope.project = project
  $scope.style =
    background: "transparent url('"+ $scope.project.banner + "') center center no-repeat"
  date = new Date(project.date)
  months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
  $scope.date = months[date.getMonth()] + " " + date.getFullYear()

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

  $(document).one "click", ".zoom", (e) ->
    e.preventDefault()
    Zoomerang.config({
      maxHeight: $(window).height() - 40,
      maxWidth: $(window).width() - 40
    }).open($(this).context).listen('.zoom')

