# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ajax:success","form#comments-form",(ev,data)->
	$(this).find("textarea").val("")
	$("#comments-box").append("
		<div class=col-xs-4>
			<div class=comment-box>
				<div class=row>
					<div class=col-xs-6>#{data.user.username}</div>
					<div class=col-xs-6><div class=right-align>#{data.creado}</div></div>
					<div class=col-xs-12>#{data.body}</div>
				</div>
			</div>
		</div>")
$(document).on "ajax:error","form#comments-form",(ev,data)->
	console.log data


$ ->
	$('.infinite-table').infinitePages
		loading: ->
	   		$(this).text("Loading...")
	 	error: ->
	   		$(this).text("Trouble! Please drink some coconut water and click again")