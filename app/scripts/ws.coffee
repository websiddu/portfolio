window.ws = window.ws or {}

window.ws = do ->

  _initFSVS = ->

  init: ->
    setTimeout ->
      $(document).foundation()
    , 500
    # _initFSVS()


$(ws.init)
