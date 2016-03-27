# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  initTranslations = ->
    $('#translations [data-language]').hide()
    $('#translations [data-language]').first().show()
    $('#translations #selected_language').on('change', (e) ->
      $('#translations [data-language]').hide()
      $("#translations [data-language=#{$(this).val()}]").show()
    )

  initRelatedProducts = ->
    $('.js-template').hide()
    $('.js-template select').attr('disabled', 'disabled')

    $('#related-products').on 'click', 'a.js-remove', (e) ->
      e.preventDefault()
      $(this).parents('.js-item').remove()

    $('#related-products a.js-add').on 'click', (e) ->
      e.preventDefault()
      $template = $('#related-products .js-template').clone().removeClass('js-template').show()
      $template.find('select').removeAttr('disabled')
      $template.insertBefore($(this))

  return if $('#translations').size == 0
  initTranslations()
  initRelatedProducts()

