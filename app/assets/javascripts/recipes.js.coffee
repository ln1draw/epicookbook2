  # Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  add_row = (event)->
    $(event.target).parent().clone(true, true).appendTo($("div.ingredient_container"))

    ingredient = ""
    $("select.ingredient").each (i, obj) ->
      ingredient += $(obj).val()
      ingredient += " "
    $(".ingredients").val ingredient

  $("input.single_amount").change ->
    amount = ""
    $("input.single_amount").each (i, obj) ->
      amount += $(obj).val()
      amount += " "
    $(".amount").val amount

  $("select.single_unit").change ->
    unit = ""
    $("select.single_unit").each (i, obj) ->
      unit += $(obj).val()
      unit += " "
    $(".unit").val unit

  $("div.next_step").click ->
    $("<li><input class='a_step' name='step' type='text' value=''/></li>").appendTo($("ol.step_container"))

    step = ""
    $("input.a_step").each (i, obj) ->
      step += $(obj).val()
      step += " line break "
    $(".step").val step

  $("input.submit").click ->
    step = ""
    $("input.a_step").each (i, obj) ->
      step += $(obj).val()
      step += " line break "
    $(".step").val step
  
  $("select.ingredient").change add_row