class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length:{ maximum: 255 }
  
  has_many :favorite_relationships
  has_many :users, through: :favorite_relationships, source: :user

  def favoriting?(user)
    self.users.include?(user)
  end
end
