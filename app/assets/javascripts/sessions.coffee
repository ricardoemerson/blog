$(document).ready ->
  # Definição das regras de validação do formulário.
  formValidations =
    full_name:
      identifier: "user_full_name"
      rules: [
        type: "empty"
        prompt: "Por favor, preencha este campo."
      ]

    location:
      identifier: "user_location"
      rules: [
        type: "empty"
        prompt: "Por favor, preencha este campo."
      ]

    password:
      identifier: "user_password"
      rules: [
        type: "empty"
        prompt: "Por favor, preencha este campo."
      ,
        type: "length[8]"
        prompt: "Este campo aceita no mínimo 8 caracteres."
      ]

    password_confirmation:
      identifier: "user_password_confirmation"
      rules: [
        type: "empty"
        prompt: "Por favor, preencha este campo."
      ,
        type: "length[8]"
        prompt: "Este campo aceita no mínimo 8 caracteres."
      ,
        type: "match[user_password]"
        prompt: "Por favor, informe o mesmo valor novamente."
      ]

    current_password:
      identifier: "user_current_password"
      rules: [
        type: "empty"
        prompt: "Por favor, preencha este campo."
      ,
        type: "length[8]"
        prompt: "Este campo aceita no mínimo 8 caracteres."
      ]

    email:
      identifier: "user_email"
      rules: [
        type: "empty"
        prompt: "Por favor, preencha este campo."
      ,
        type: "email"
        prompt: "Por favor, informe um endereço de email válido."
      ]

  # Definição das regras de validação do formulário.
  formValidationsEditUser =
    full_name:
      identifier: "user_full_name"
      rules: [
        type: "empty"
        prompt: "Por favor, preencha este campo."
      ]

    location:
      identifier: "user_location"
      rules: [
        type: "empty"
        prompt: "Por favor, preencha este campo."
      ]

    password:
      identifier: "user_password"
      optional: true
      rules: [
        type: "length[8]"
        prompt: "Este campo aceita no mínimo 8 caracteres."
      ]

    password_confirmation:
      identifier: "user_password_confirmation"
      optional: true
      rules: [
        type: "length[8]"
        prompt: "Este campo aceita no mínimo 8 caracteres."
      ,
        type: "match[user_password]"
        prompt: "Por favor, informe o mesmo valor novamente."
      ]

    current_password:
      identifier: "user_current_password"
      rules: [
        type: "empty"
        prompt: "Por favor, preencha este campo."
      ,
        type: "length[8]"
        prompt: "Este campo aceita no mínimo 8 caracteres."
      ]

    email:
      identifier: "user_email"
      rules: [
        type: "empty"
        prompt: "Por favor, preencha este campo."
      ,
        type: "email"
        prompt: "Por favor, informe um endereço de email válido."
      ]


  # Define os ajustes de comportamento das regras.
  settings =
    inline: true
    on: 'blur'
    onSuccess: ->
      $(".segment").dimmer("show")
      return

  # Faz a validação dos dados do formulário.
  $(".new_user").form formValidations, settings
  $(".edit_user").form formValidationsEditUser, settings

  return
