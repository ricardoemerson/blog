$(document).ready ->
  # Definição das regras de validação do formulário.
  formValidations =
    title:
      identifier: "post_title"
      rules: [
        type: "empty"
        prompt: "Por favor, preencha este campo."
      ]

    content:
      identifier: "post_content"
      rules: [
        type: "empty"
        prompt: "Por favor, preencha este campo."
      ]

  # Define os ajustes de comportamento das regras.
  settings =
    inline: true
    on: 'blur'
    onSuccess: ->
      $(".segment").dimmer("show")
      return

  # Faz a validação dos dados do formulário.
  $(".new_post, .edit_post").form formValidations, settings

  return