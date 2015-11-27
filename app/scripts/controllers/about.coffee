"use strict"
angular.module("websidduApp").controller "aboutCtrl", ($scope, $http, $rootScope, constants) ->
  $scope.socialprofiles = []
  # $http(
  #   url: "resources/social.json"
  #   method: "GET"
  # ).success (data, status) ->
  #   $scope.socialprofiles = data


  _loadMusic = ->
    $http(
      url: "#{constants.base_url}api/music"
      method: "GET"
    ).success (data, status) ->
      $scope.music = data

  _loadChart = ->
    setTimeout ->
      $http
        url: "#{constants.base_url}api/github?callback=JSON_CALLBACK"
        method: 'JSONP'
      .success (data) ->
        data = MG.convert.date(data.raw, 'date');
        MG.data_graphic({
            # title: "<a href='https://github.com/websiddu' target='_blank'>My Github contributions</a>",
            description: "",
            animate_on_load: true
            data: data
            full_width: true
            height: 200
            min_y: 0
            # custom_line_color_map:
            target: '.landing-chart'
            x_accessor: 'date'
            left: 70
            y_accessor: 'score'
            y_label: 'No. contributions'
            interpolate: "monotone"
            xax_count: 8
            # bottom: 50
        })
    , 10


  $scope.init = ->
    _loadChart()
    _loadMusic()


  $scope.init()
  # $scope.jobs = []
  # $http(
  #   url: "resources/jobs.json"
  #   method: "GET"
  # ).success (data, status) ->
  #   $scope.jobs = data
