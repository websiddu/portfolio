window.ws = window.ws or {}

window.ws = do ->

  _initFSVS = ->
    # setTimeout ->
    #   $("body *").mousemove (e) ->
    #     console.log e.pageX
    #     amountMovedX = (e.pageX * -1 / 100)
    #     amountMovedY = (e.pageY * 1 / 50)
    #     $('.landing-banner').css "background-position", amountMovedX + "px " + amountMovedY + "px"
    #     return
    # , 100



  init: ->
    _initFSVS()


$(ws.init)
