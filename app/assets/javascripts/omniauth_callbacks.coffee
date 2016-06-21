jQuery ->
  $('body').prepend('<div id="fb-root"></div>')

  $.ajax
    url: "#{window.location.protocol}//connect.facebook.net/en_US/sdk.js"
    dataType: 'script'
    cache: true

window.fbAsyncInit = ->
  FB.init(appId: '<%= "316086441848514" %>', cookie: true)

  $('#facebook_signin').click (e) ->
    e.preventDefault()
    FB.login (response) ->
      window.location = '/auth/facebook/callback' if response.authResponse

  $('#facebook_signout').click (e) ->
    FB.getLoginStatus (response) ->
      FB.logout() if response.authResponse
    true