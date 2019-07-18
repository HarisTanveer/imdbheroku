# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

responseMessage = (msg) ->
  $('.success-box').fadeIn 200
  $('.success-box div.text-message').html '<span>' + msg + '</span>'
  return

$(document).ready ->

  ### 1. Visualizing things on Hover - See next part for action on click ###

  $('#stars li').on('mouseover', ->
    onStar = parseInt($(this).data('value'), 10)
    # The star currently mouse on
    # Now highlight all the stars that's not after the current hovered star
    $(this).parent().children('li.star').each (e) ->
      if e < onStar
        $(this).addClass 'hover'
      else
        $(this).removeClass 'hover'
      return
    return
  ).on 'mouseout', ->
    $(this).parent().children('li.star').each (e) ->
      $(this).removeClass 'hover'
      return
    return

  ### 2. Action to perform on click ###

  $('#stars li').on 'click', ->
    onStar = parseInt($(this).data('value'), 10)
    # The star currently selected
    stars = $(this).parent().children('li.star')
    i = 0
    $('#tick_image').attr("style", "");
    while i < stars.length
      $(stars[i]).removeClass 'selected'
      i++
    i = 0
    while i < onStar
      $(stars[i]).addClass 'selected'
      i++
    $('#review_rating').val i
    # JUST RESPONSE (Not needed)
    ratingValue = parseInt($('#stars li.selected').last().data('value'), 10)
    msg = ''
    if ratingValue > 1
      msg = 'Thanks! You rated this ' + ratingValue + ' stars.'
    else
      msg = 'We will improve ourselves. You rated this ' + ratingValue + ' stars.'
    responseMessage msg
    return
  return
