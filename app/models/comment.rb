class Comment < ActiveRecord::Base
  # include Voteable
  include Voteable
  #belongs_to :user
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  belongs_to :post

  validates :body, presence: true

  # def total_votes
  #   up_votes - down_votes
  # end

  # def up_votes
  #   self.votes.where(vote: true).size
  # end

  # def down_votes
  #   self.votes.where(vote: false).size
  # end
end