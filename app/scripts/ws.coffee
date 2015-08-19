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



    # kkeys = []
    # konami = '38,38,40,40,37,39,37,39,65,65'
    # $(document).keydown (e) ->
    #   console.log(e)
    #   kkeys.push e.keyCode
    #     console.log("wath..??")
    #     $(document).unbind 'keydown', arguments.callee
    #     $.getScript 'http://www.cornify.com/js/cornify.js', ->
    #       cornify_add()
    #       $(document).keydown cornify_add
    #       return
    #   return

  _setupVideo = ->
    options = {
      controls: ["play", "current-time", "duration", "mute", "volume", "fullscreen"],
      debug: true
    }

    plyr.setup(options)



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
      p.removeClass 'hide flipOutX animated-sm'
      p.addClass 'flipInX animated-sm'

    if delightCount > 6
      p.html("Seems like you’re really enjoying yourself!")

    if delightCount > 8
      p.html("Seems like you’re really really enjoying yourself!")

    if delightCount > 10
      p.html("It's too much now! Why not take a look at my portolio?")

    clearTimeout(hideHint)
    hideHint = setTimeout (->
      p.removeClass 'flipInX animated-sm'
      p.addClass 'flipOutX animated-sm'
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
