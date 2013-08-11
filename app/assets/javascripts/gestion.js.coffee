# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('#search-field').keyup (e) ->
    visibleItems = 0
    for field, i in $('table tbody tr')
      if $(field).attr('data-search').indexOf($('#search-field').val().toLowerCase()) isnt -1
        $(field).show()
        $(field).attr("class", if visibleItems % 2 is 0 then 'list_line_even' else 'list_line_odd')
        visibleItems += 1
      else 
        $(field).hide()

$(document).ready ->
  $('table tbody tr').click ->
	  $('#data').html($(this).attr('data-search'))