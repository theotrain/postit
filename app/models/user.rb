class User < ActiveRecord::Base
  include Sluggable
  
  has_many :posts #, foreign_key: :user_id
  has_many :comments
  has_many :votes

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: { minimum: 3 }

  # before_create :generate_slug #only happens once, on creation

  # def generate_slug
  #   s = self.username.gsub(' ', '-').downcase
  #   s.gsub!(/[^a-zA-Z0-9-]/,'')
  #   i = 1;
  #   base_slug = s
  #   while User.exists?(slug: s) and !((User.where(slug: s).size == 1) and (User.find_by(slug: s).id == self.id)) do
  #     s = base_slug + i.to_s
  #     i += 1
  #   end
  #   self.slug = s
  # end

  # def to_param
  #   self.slug
  # end

  def admin?
    self.role == 'admin'
  end

  def moderator?
    self.role == 'moderator'
  end


end