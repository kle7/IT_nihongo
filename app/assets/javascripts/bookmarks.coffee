# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $( ".bookmark" ).click ->
    # alert("hello")
    $(this).toggleClass("bookmarked")
    # $url=location.host+"/bookmarks"
    # alert($url)
    $.post "/bookmarks", $( this ).closest("form").serialize(), ->
    # $(this).closest("li").remove()
