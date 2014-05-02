class @Weather

  constructor: (element, query) ->
    @el = element
    @api_key = '2quhf9g7h3ru7ghpstqhk2ua'
    @query = query
    @getForecast()

  getForecast: =>
    $.ajax(
      url: 'http://api.worldweatheronline.com/free/v1/weather.ashx'
      dataType: 'jsonp'
      data:
        key: @api_key
        format: 'json'
        q: @query
        num_of_days: 1
      beforeSend: => @showSpinner()
      complete: => @hideSpinner()
      error: => @displayError()
      success: (response) =>
        try
          @update(response)
        catch error
          @displayError()
    )

  update: (response) ->
    $(@el).find("[data-weather='temp_max_c']").text("H: #{response.data.weather[0].tempMaxC}°")
    $(@el).find("[data-weather='temp_min_c']").text("L: #{response.data.weather[0].tempMinC}°")
    $(@el).find("[data-weather='temp_c']").text("#{response.data.current_condition[0].temp_C}°")
    $(@el).find("[data-weather='city']").text(response.data.request[0].query)
    $(@el).find("[data-weather='description']").text(response.data.current_condition[0].weatherDesc[0].value)

  displayError: ->
    $(@el).append('Sorry. Weather could not be processed at this moment.')

  showSpinner: ->
    $(@el).find('.icon-spinner').show()

  hideSpinner: ->
    $(@el).find('.icon-spinner').hide()

$.fn.weatherize = (query) ->
  @each ->
    new Weather($(this), query)

$ ->
  $("[data-weatherize]").each ->
    $(this).weatherize($(this).data('weatherize'))