window.ws = window.ws or {}

window.ws = do ->

  init: ->
    setTimeout ->
      $(document).foundation()
    , 500

$(ws.init)
