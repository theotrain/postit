class Vote < ActiveRecord::Base
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post
  belongs_to :voteable, polymorphic: true #create 'voteable' getter/setters

  validates_uniqueness_of :creator, scope: :voteable
end