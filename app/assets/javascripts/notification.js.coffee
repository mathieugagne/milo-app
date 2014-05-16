class @Notification
  constructor: (message, type)->
    @message = message
    @type = type
    @flash = $(".flash-container").html("").show()
    @render()
    @bindEvents()

  render: ->
    $('<div/>',
      class: "flash-#{@type}",
      html: @message
    ).appendTo(".flash-container")

  bindEvents: =>
    @flash.click -> $(@).fadeOut()
    setTimeout (=> @flash.fadeOut()), 5000