module ApplicationHelper
  # Define os tipos de alertas utilizados pela aplicação e seus respectivos ícones.
  ALERT_TYPES = [:error, :info, :success, :warning, :default]
  ICON_TYPES = ['remove circle', 'info circle', 'checkmark box', 'warning sign', 'comments outline']

  ##
  # Método utilizado para gerar tags html para ícones, usando formato de ícones definidos pelo Semantic-UI.
  #
  # ==== Parmetros:
  #
  # * +names+ - Nome do ícone.
  #
  # ==== Retorno:
  #
  # * Retorna uma tag no formato html para ícones.
  #
  # ==== Exemplos:
  #
  # Exemplo de utilização:
  #
  #    semantic_icon 'check'
  #    # <i class="check icon"></i>
  #
  def semantic_icon(*names)
    content_tag :i, nil, class: names.map { |name| "#{name.to_s.gsub('_', '-')}" } << 'icon'
  end

  ##
  # Método para exibir mensagens flash baseadas nas classes do Semantic-UI.
  #
  # ==== Retorno:
  #
  # * Uma mensagem flash usando o estilo de mensagens do Semantic-UI.
  #
  # ==== Exemplos:
  #
  # Exemplo de utilização:
  #
  #    = semantic_flash
  #
  def semantic_flash
    output = ''
    flash.each do |type, message|
      next if message.blank?
      type = :success if type.to_sym == :notice
      type = :error   if type.to_sym == :alert
      next unless ALERT_TYPES.include?(type.to_sym)
      output += flash_container(type, message)
    end

    raw(output)
  end

  # Método complementar para gerar containers de mensagens para o semantic_flash.
  def flash_container(type, message)
    content_tag(:div, class: "ui #{type} message") do
      content_tag(:i, '', class: 'close icon') + message
    end
  end

  ##
  # Método utilizado para criar uma mensagem no formato do semantic-ui utilizando o elemento message.
  #
  # ==== Parâmetros:
  #
  # * +type+    - Tipo de mensagem. Os tipos de mensagens são: :info, :success, :warning, :error, :default.
  # * +title+   - Título da mensagem.
  # * +icon+    - Nome do ícone a ser exibido na mensagem. Se o nome do ícone não for informado, um ícone padrão, de acordo com o tipo da mensagem, será exibido. Caso seja informando o valor false, a mensagem não possuirá um ícone de exibição.
  # * +message+ - Texto da mensagem.
  #
  # ==== Retorno:
  #
  # * Retorna uma string no formato HTML contendo a mensagem a ser exibida na página.
  #
  # ==== Exemplos:
  #
  # Exemplo de utilização:
  #
  #    = semantic_message message: 'Existem dados inconpletos para este atendimento.'
  #    = semantic_message title: 'Atenção', message: 'Existem dados inconpletos para este atendimento.'
  #    = semantic_message type: :warning, message: 'Existem dados inconpletos para este atendimento.'
  #    = semantic_message type: :success, title: 'Parabéns', message: 'Registro cadastrado com sucesso.'
  #    = semantic_message type: :error, title: 'Atenção', message: 'Não foi possível localizar os dados informados.'
  #    = semantic_message type: :warning, title: 'Atenção', icon: 'list layout', message: 'Existem dados inconpletos para este atendimento.'
  #    = semantic_message type: :warning, title: 'Atenção', icon: false, message: 'Existem dados inconpletos para este atendimento.'
  #
  def semantic_message(type: :default, title: nil, icon: nil, message: nil)
    # Verifica se será utilizado o ícone padrão ou o ícone informado pelo usuário.
    icon_name = icon.nil? ? ICON_TYPES[ALERT_TYPES.index(type)] : icon

    # Caso o parâmetro icon seja igual a false, criará uma mensagem sem ícone. Do contrário, a mensagem possuirá um ícone.
    if icon_name
      html = <<-HTML
        <div class="ui icon #{type} message">
          <i class="close icon"></i>
          <i class="#{icon_name} icon"></i>
          <div class="content">
            <div class="header">
              #{title}
            </div>
            <p>#{message}</p>
          </div>
        </div>
      HTML
    else
      html = <<-HTML
        <div class="ui #{type} message">
          <i class="close icon"></i>
          <div class="header">
            #{title}
          </div>
          <p>#{message}</p>
        </div>
      HTML
    end

    # Retorna a mensagem em formato HTML já formatada e de forma segura.
    html.html_safe
  end

  # Método utilizado para verificar se uma pesquisa está sendo realizada.
  def searching?
    true if params[:search]
  end

  # Método utilizado para exiber o nome do controller e da ação que está atualmente sendo executada.
  def controller_action_name
    "#{controller.controller_name} > #{controller.action_name}"
  end
end
