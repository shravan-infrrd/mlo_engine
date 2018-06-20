$.R ||= {}

$.R.MLO_SEARCH =

  init: ->
    $mloSearchContainer = $('.js--mlo-search-container')
    $('.js--mlo-search-button').on 'click', (e, results) ->
      if $(this).hasClass 'c-pointer-none'
        return
      $(this).addClass 'c-pointer-none'
      $this = $(this)
      ajaxUrl = $this.attr('data-url')
      $.ajax
        type: 'GET'
        url: ajaxUrl
        data:
          term: $('#assign_search_field').val()
        success: (data) ->
          $mloSearchContainer.slideUp 300, ->
            $(this).html(data).slideDown()
        complete: ->
          $('.js--mlo-search-button').removeClass('c-pointer-none')

    $('#test').on 'ajax:success', (e, results) ->
      $('#assign_search_field').autocomplete('close');
      ajaxUrl = $('.js--mlo-search-button').attr('data-url')
      $.ajax
        type: 'GET'
        url: ajaxUrl
        data:
          term: $('#assign_search_field').val()
        success: (data) ->
          $mloSearchContainer.slideUp 300, ->
            $(this).html(data).slideDown()
