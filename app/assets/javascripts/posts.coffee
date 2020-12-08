# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@commentTextEdit = (textField,x) ->
  if textField.value == ''
    $("[id = 'btnCommentAdd'][post_id =" + x + " ]").hide()
  else
    $("[id = 'btnCommentAdd'][post_id =" + x + " ]").show()
  return
