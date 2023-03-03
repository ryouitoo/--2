class Book < ApplicationRecord
  belongs_to  :user
  has_many :favorites, dependent: :destroy #いいね機能
  has_many :book_comments, dependent: :destroy#コメント機能


  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
