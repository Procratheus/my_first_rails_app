class Topic < ActiveRecord::Base
  has_many :posts

  page = 0
  limit = 10

  def self.alex_paginate(page, limit)
    limit(limit).offset(page * limit) 
  end
end
