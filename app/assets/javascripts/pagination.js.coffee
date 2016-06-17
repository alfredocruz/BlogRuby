$ ->
 $('.infinite-table').infinitePages
  loading: ->
      $(this).text("Loading...")
   error: ->
      $(this).text("Trouble! Please drink some coconut water and click again")