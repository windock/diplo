# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  return if $('#translations').size == 0
  $('#translations [data-language]').hide()
  $('#translations [data-language]').first().show()
  $('#translations #selected_language').on('change', (e) ->
    $('#translations [data-language]').hide()
    $("#translations [data-language=#{$(this).val()}]").show()
  )
