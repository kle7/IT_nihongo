# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $( "#notification" ).click ->
    $.post "/notifications", $( this ).next().serialize(), ->
    $.post "/notifications/show_list", $(this).next().next().serialize(), (data) ->
      text =""
      count = 0
      $.each data.notifications, ( index, notification ) ->
        if data.notifications[index].content=="follow"
          text += "<li class='notification-item'>"+"<span><b>"
          text += data.senders[index]
          text += "</b> want to follow you</span>"
          text += "<form action='/notifications/decline' method='post' class='follow-btns'>"
          text += "<input type='hidden' name='notification_id' value="
          text += data.notifications[index].id
          text += "></input>"
          text += "<span class='follow-btn accept-follow'>accept</span>"
          text += "<span class='follow-btn decline-follow'>decline</span>"
          text += "</form>"
          text += "</li>"
          count++
        if count>10
          return false
      $(".notification-list").html(text)
      if count==0
        $(".notification-list").html("<li class='notification-item'>You don't have notification</li>")
      $('.notification-list').toggleClass("notification-list-active")
  $( ".notification-list").on 'click', '.accept-follow', ->
    $.post "/notifications/accept", $( this ).closest("form").serialize(), ->
    $(this).closest("li").remove()
    if $(".notification-list li").length==0
      $(".notification-list").html("<li class='notification-item'>You don't have notification</li>")
  $( ".notification-list" ).on 'click', '.decline-follow', ->
    $.post "/notifications/decline", $( this ).closest("form").serialize(), ->
    $(this).closest("li").remove()
    if $(".notification-list li").length==0
      $(".notification-list").html("<li class='notification-item'>You don't have notification</li>")
