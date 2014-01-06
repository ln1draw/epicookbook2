# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("select.ingredient").change ->
    ingredient = ""
    $("select.ingredient").each (i, obj) ->
      ingredient += $(obj).val()
      ingredient += " "

    $(".ingredients").val ingredient
    console.log ingredient