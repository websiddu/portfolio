window.ws = window.ws or {}

window.ws = do ->
  delightCount = 0
  delightSingleFlag = false
  delightEasterEggFlag = false
  $document = null
  $delight = null

  hideHint = null
  removeAnimating = null


  _initDelight = ->
    $document.on 'mouseenter mouseleave', 'span.delight', delightBounce

  delightBounce = (e) ->
    delight = $(this)
    p = delight.find('.egg')
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
      p.removeClass 'hide fadeOutUp animated-sm'
      p.addClass 'slideInDown animated-sm'

    if delightCount > 6
      p.html("Seems like you’re really enjoying yourself!")

    if delightCount > 8
      p.html("Seems like you’re really really enjoying yourself!")

    if delightCount > 10
      p.html("It's too much now! Why not take a look at my portolio?")

    clearTimeout(hideHint)
    hideHint = setTimeout (->
      p.removeClass 'slideInDown animated-sm'
      p.addClass 'fadeOutUp animated-sm'
      return
    ), 2000

    return

  init: ->
    setTimeout ->
      $document = $(document)
      $delight = 'span.delight'
      $(document).foundation()
      _initDelight()
    , 500

$(ws.init)
