$(document).ready ->
  # Definição para fechar as mensagens do semantic-ui.
  $(".message .close").on "click", ->
    $(this).closest(".message").transition("browse")
    return

  # Componente checkbox do Semantic UI.
  $(".ui.checkbox").checkbox()


  # Componente popup do Semantic UI.
  $(".ui-popup").popup()


  # Componente select dropdown do Semantic UI.
  $('select.dropdown').dropdown()


  # Componente menu dropdown do Semantic UI.
  #$('.ui.dropdown').dropdown()


  # Converte o campo para caracteres minúsculos.
  $("#user_email, #email").on "blur", ->
    @value = @value.toLowerCase()
    return

  return
