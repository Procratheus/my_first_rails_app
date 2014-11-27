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
  
  def lewis_paginate(topics)
    @page = 0
    @limit = 10
    @page_total = (Topic.all.count/topics.count).ceil.to_i
    @page_array = (@page..@page_total).to_a
    @page_array.each do |page|
      content_tag :span, capture(link_to "#{page}", topics_path)
    end
  end

end
