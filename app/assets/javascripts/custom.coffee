#To be fixed in later commits
toggleVideo = (state) ->
  div = document.getElementById('youvideo')
  iframe = div.getElementsByTagName('iframe')[0].contentWindow
  div.style.display = if state == 'hide' then 'none' else ''
  if state == 'hide' then jQuery('.youvideo').get(0).stopVideo() 

$(document).ready ->

  $('.play-trailer').on 'click', ->
    toggleVideo 'show'
    $('.moviecard').addClass 'movie-view-trailer'

  $('.back-btn').click ->
    $('.moviecard').removeClass 'movie-view-trailer'
    toggleVideo 'hide'

  jQuery('#myCarousel').carousel interval: 3000 

  $('#btnadd').click ->
    $('.add_actor').toggle 'slide'
  
  url = window.location.href
  if (~url.indexOf("?"))
    url = url.substring(0, url.indexOf('?'))
  id = url.substring(url.lastIndexOf('/') + 1)
  token = $('meta[name="csrf-token"]').attr('content')
  $('#actorsubmit').click ->
    $.ajax
      type: 'POST'
      url: id + '/' + $('#actors_actor_id').val() + '/addActor'
      headers: 'X-CSRF-Token': document.querySelector('meta[name=csrf-token]').content
      success: (result) ->
        window.location.reload()
        return

  $('#div-edit > a ').click ->
    $('#myPost').attr 'method', 'post'
    $('#myPost').attr 'action', '/reviews/'+ $(this).data 'id'
    $('<input>').attr(
      type: 'hidden'
      value: 'patch'
      name: '_method').appendTo '#myPost'
    a = $(this).parent().siblings('#description').text()
    $('#review_description').val a

  $('#comment_btn').on 'click', ->
    e.preventDefault()
    if $('#review_rating').val() == ''
      alert 'cannot submit without rating'
    else
      $('#myPost').submit()

  $('#search_textbox').keydown ->
    $('#search_submit').click()


  $('#btn_search_show').on 'click', ->
    if $('#search_div').css('display') == 'none'
      $('#search_div').show()
    else
      $('#search_div').hide()

  $('[data-toggle="popover"]').popover()
return