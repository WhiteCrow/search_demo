# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.Result =
  to_html: (item)->
    "<div class='box box-#{item['type']}'><div class='box-title'><img src=#{item['image_url']} class='img-circle pull-left'><h4>#{item['name']}</h4></div><div class='box-content'>#{item['text']}</div></div>"
