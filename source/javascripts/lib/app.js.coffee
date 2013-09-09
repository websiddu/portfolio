$design = $('.js_design_trigger')
$design_parent = $design.parent()

$code = $('.js_code_trigger')
$code_parent = $code.parent()

$default = $('.js_default_trigger')
$default_parent = $default.parent()

$('.l-design-trigger').on 'mouseenter', ->
  $('.l-code-trigger').css('opacity', 0.1)
$('.l-design-trigger').on 'mouseleave', ->
  $('.l-code-trigger').css('opacity', 1)
  # $code_parent.addClass('fadeOutRightBig')
  # $('.l-design-trigger').find("p.l-d-d").addClass("fadeInBottomBig")
  # setTimeout(->
  #   $code_parent.hide()
  #   $default_parent.removeClass("large-4 small-4").addClass('large-3 small-3')
  #   $design_parent.removeClass("large-4 small-4").addClass('large-6 small-6')
  #   $('.l-design-trigger').find("p.l-d-d").show()
  # , 100
  # )

# $('.l-design-trigger').on 'mouseleave', ->
#   $default_parent.addClass("large-4 small-4").removeClass('large-3 small-3')
#   $design_parent.addClass("large-4 small-4").removeClass('large-6 small-6')
#   $code_parent.removeClass('fadeOutRightBig').addClass('fadeInRightBig')
#   setTimeout(->
#     $code_parent.show()
#   , 100
#   )
