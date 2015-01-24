"use strict"
angular.module("websidduApp").controller "MainCtrl", ($scope, $rootScope, $location, $timeout) ->
  _desingAvatar = $('.js_avatar_design')
  _defaultAvatar = $('.js_default_trigger')
  _codeAvatar = $('.js_avatar_code')

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
      d3.json "http://websiddu.herokuapp.com/github", (data) ->
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
