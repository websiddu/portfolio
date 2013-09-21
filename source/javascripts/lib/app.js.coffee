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


$("#skills").highcharts
  chart:
    type: "bar"
    backgroundColor: "transparent"

  title:
    text: "Some of my programming skills"

  xAxis:
    categories: ["CSS/HTML", "jQuery", "Javascript", "Axure RP","Photoshop", "Illustrator", "Ruby on Rails", "Java/Android"]
    title:
      text: null
  colors: [
    '#89A54E'
    '#4572A7'
    '#80699B'
    '#3D96AE'
    '#DB843D'
    '#92A8CD'
    '#A47D7C'
    '#B5CA92'
    '#AA4643'
  ]
  legend:
    enabled: false
  yAxis:
    min: 0
    title:
      text: "Skill level(%)"
      align: "high"

    labels:
      overflow: "justify"

  tooltip:
    valueSuffix: " %"

  plotOptions:
    bar:
      colorByPoint: true
      dataLabels:
        enabled: true

  credits:
    enabled: false

  series: [
    name: "Skill level"
    data: [95, 92, 90, 85, 80, 40, 60, 30]
  ]
