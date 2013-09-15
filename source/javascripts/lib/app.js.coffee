$('.l-design').hoverIntent ->
  $('.l-code').css('opacity', 0.1)
  $('.js_avatar_design').hide()
  $('.js_avatar_code').hide()
  $('.js_default_trigger').stop().show().animo
    animation: "fadeOutUp"
    duration: 0.5
    keep: true
  , ->
    $('.js_default_trigger').hide()
    $('.js_avatar_design').stop().show().animo
      animation: "fadeInDown"
      duration: 0.5
      keep: true
    , ->
      $('.js_avatar_design').show()
      $('.js_default_trigger').hide()
      $('.js_avatar_code').hide()
, ->
  $('.l-code').css('opacity', 1)
  $('.js_avatar_design').hide()
  $('.js_avatar_code').hide()
  $('.js_avatar_design').stop().show().animo
    animation: "fadeOutUp"
    duration: 0.5
    keep: true
  , ->
    $('.js_avatar_design').hide()
    $('.js_default_trigger').stop().show().animo
      animation: "fadeInDown"
      duration: 0.5
      keep: true
    , ->
      $('.js_avatar_design').hide()
      $('.js_default_trigger').show()
      $('.js_avatar_code').hide()



$('.l-code').hoverIntent ->
  $('.l-design').css('opacity', 0.1)
  $('.js_avatar_code').hide()
  $('.js_avatar_design').hide()
  $('.js_default_trigger').stop().show().animo
    animation: "fadeOutUp"
    duration: 0.5
    keep: true
  , ->
    $('.js_default_trigger').hide()
    $('.js_avatar_code').stop().show().animo
      animation: "fadeInDown"
      duration: 0.5
      keep: true
    , ->
      $('.js_avatar_design').hide()
      $('.js_default_trigger').hide()
      $('.js_avatar_code').show()
, ->
  $('.l-design').css('opacity', 1)
  $('.js_avatar_code').hide()
  $('.js_avatar_code').stop().show().animo
    animation: "fadeOutUp"
    duration: 0.5
    keep: true
  , ->
    $('.js_avatar_code').hide()
    $('.js_avatar_design').hide()
    $('.js_default_trigger').stop().show().animo
      animation: "fadeInDown"
      duration: 0.5
      keep: true
    , ->
      $('.js_avatar_design').hide()
      $('.js_default_trigger').show()
      $('.js_avatar_code').hide()


data = [
  value: 30
  color: "#F7464A"
,
  value: 50
  color: "#E2EAE9"
,
  value: 100
  color: "#D4CCC5"
,
  value: 40
  color: "#949FB1"
,
  value: 120
  color: "#4D5360"
]


options =

  #Boolean - Whether we should show a stroke on each segment
  segmentShowStroke: true

  #String - The colour of each segment stroke
  segmentStrokeColor: "#fff"

  #Number - The width of each segment stroke
  segmentStrokeWidth: 2

  #The percentage of the chart that we cut out of the middle.
  percentageInnerCutout: 50

  #Boolean - Whether we should animate the chart
  animation: true

  #Number - Amount of animation steps
  animationSteps: 100

  #String - Animation easing effect
  animationEasing: "easeOutBounce"

  #Boolean - Whether we animate the rotation of the Doughnut
  animateRotate: true

  #Boolean - Whether we animate scaling the Doughnut from the centre
  animateScale: true

  #Function - Will fire on animation completion.
  onAnimationComplete: null

ctx = document.getElementById("des_dev").getContext("2d");
chart = new Chart(ctx).Doughnut(data,options);


