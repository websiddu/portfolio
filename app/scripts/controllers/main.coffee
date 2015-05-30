"use strict"
angular.module("websidduApp").controller "MainCtrl", ($scope, $rootScope, $location, $timeout, constants) ->

  $scope.projectThumb = (img) ->
    "background-image": "url(#{img})"

  $scope.init = ->
    _loadChart()
    #_bindMouseWeel()

  _bindMouseWeel = ->
    $(window).on('mousewheel', (event) ->
      return if $location.path() != '/'
      if $(window).scrollTop() + $(window).height() is $(document).height()
        $location.path('/portfolio')
      return
    )

  _loadChart = ->
    setTimeout ->
      d3.json "#{constants.base_url}api/github/", (data) ->
        data = MG.convert.date(data.raw, 'date');
        MG.data_graphic({
            title: "<a href='https://github.com/websiddu' target='_blank'>Github contributions</a>",
            description: "",
            animate_on_load: true
            data: data
            width: $(window).width()
            height: 220,
            min_y: 0
            # custom_line_color_map:
            target: '.landing-chart'
            x_accessor: 'date'
            left: 70
            y_accessor: 'score'
            y_label: 'No. contributions'
            interpolate: "monotone"
            xax_count: 20
            # bottom: 50
        })
    , 10

  $scope.init()
