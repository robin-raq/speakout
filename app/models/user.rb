class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, dependent: :destroy
  has_one_attached :avatar
      
  def username
    return email.split('@')[0].capitalize  
  end

  private
  
  def comment_created
    self.number_of_comments = number_of_comments + 1 
    save
    number_of_comments
  end
end
