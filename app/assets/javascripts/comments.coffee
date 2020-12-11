# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@commentEdit = (button,id) ->
  button.hidden = true
  $(button).parent().find("#commentUpdate").show()
  text = $("#commentText#{id}").html()
  $("#commentText#{id}").html("<textarea oninput=\"commentTextEdit(this,#{id})\">#{text}</textarea>")
  return
@commentTextEdit = (textField,id) ->
  $("input[class='btn btn-secondary'][id='commentUpdate'][commentID=#{id}]").parent().find("input[name='comment[comment_text]']").val(textField.value)
  return
