class Post < ActiveRecord::Base
  # include Voteable
  include Voteable
  include Sluggable

  #belongs_to :user #, foreign_key: :user_id
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, presence: true, length: { minimum: 5 }
  validates :url, presence: true

  # before_save :generate_slug

  # def generate_slug
  #   s = self.title.gsub(' ', '-').downcase
  #   s.gsub!(/[^a-zA-Z0-9-]/,'')
  #   i = 1;
  #   base_slug = s
  #   while Post.exists?(slug: s) do
  #     s = base_slug + i.to_s
  #     i += 1
  #   end
  #   self.slug = s
  # end

  # def to_param
  #   self.slug
  # end
end