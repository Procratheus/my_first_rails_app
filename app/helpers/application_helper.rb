module ApplicationHelper

  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end

  def my_name
    "Alexander lewis"
  end

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end

  def vote_link_classes(post, string)
    if string == "up" && current_user.voted(post) && current_user.voted(post).up_vote?    
      "glyphicon glyphicon-chevron-up voted"
    elsif string == "up"
      "glyphicon glyphicon-chevron-up"
    elsif string == "down" && current_user.voted(post) && current_user.voted(post).down_vote?
      "glyphicon glyphicon-chevron-down voted"
    elsif string == "down"
      "glyphicon glyphicon-chevron-down"
    else
      " "
    end    
  end
  
end
