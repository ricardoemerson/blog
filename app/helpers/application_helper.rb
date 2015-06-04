module ApplicationHelper
  ALERT_TYPES = [:error, :info, :success, :warning, :default]
  ICON_TYPES = ['remove circle', 'info circle', 'checkmark box', 'warning sign', 'comments outline']

  def semantic_message type: :default, title: nil, icon: nil, message:
    icon_name = icon.nil? ? ICON_TYPES[ALERT_TYPES.index(type)] : icon

    unless icon_name
      html = <<-HTML
        <div class="ui #{type} message">
          <i class="close icon"></i>
          <div class="header">
            #{title}
          </div>
          <p>#{message}</p>
        </div>
      HTML
    else
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
    end

    html.html_safe
  end
end
