class Post < ActiveRecord::Base
  #belongs_to :user #, foreign_key: :user_id
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_category
end