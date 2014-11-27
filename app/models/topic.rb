class Topic < ActiveRecord::Base
  has_many :posts

  @page = 0
  @limit = 10

  def lewis_paginate(topics)
    @page_total = (Topic.all.count/topics.count).ceil
    @page_array = (@page..@page_total).to_a
    @page_array.each do |page|
      content_tag :span, capture(page)
    end
  end

  def self.alex_paginate(page, limit)
    limit(limit).offset(page * limit) 
  end

end
