window.ws = window.ws or {}

window.ws = do ->
  delightCount = 0
  delightSingleFlag = false
  delightEasterEggFlag = false

  hideHint = null
  removeAnimating = null


  _initDelight = ->
    delight = $('span.delight')
    delight.hover delightBounce, delightBounce
    delight.click delightBounce

  delightBounce = ->
    delight = $('span.delight')
    if delightSingleFlag == false
      delightSingleFlag = true
    if !delight.hasClass('animating')
      delight.addClass 'animating'
      delightCount++
    else
      delight.removeClass 'animating'
      return

    if delightCount > 4
      if delightEasterEggFlag is false
        delightEasterEggFlag = true
      $('.delight p').removeClass 'hide fadeOutUp animated-sm'
      $('.delight p').addClass 'slideInDown animated-sm'

    if delightCount > 6
      $('.delight p').html("Seems like you’re really enjoying yourself!")

    if delightCount > 8
      $('.delight p').html("Seems like you’re really really enjoying yourself!")

    if delightCount > 10
      $('.delight p').html("It's too much now! Why not take a look at my portolio?")

    clearTimeout(hideHint)
    hideHint = setTimeout (->
      $('.delight p').removeClass 'slideInDown animated-sm'
      $('.delight p').addClass 'fadeOutUp animated-sm'
      return
    ), 2000

    return

  init: ->
    setTimeout ->
      delight = $('span.delight')
      $(document).foundation()
      _initDelight()
    , 500

$(ws.init)
