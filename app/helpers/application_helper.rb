module ApplicationHelper
  include ActionView::Helpers::TagHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def current_user
    super || User.new(name: 'Guest')
  end

  def character_medal(character)
    case character.type
      when "changeling"
        "CtL"
      else
        "WoD"
    end
  end

end
