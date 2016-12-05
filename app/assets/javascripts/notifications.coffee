# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $( "#notification" ).click ->
    $('.notification-list').toggleClass("notification-list-active")
    $.post "/notification", $( this ).closest("form").serialize(), ->
