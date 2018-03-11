class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis
  has_many :collaborators
  has_many :wikis, through: :collaborators

  enum role: [:standard, :premium, :admin]
  after_initialize :set_default_role


  def set_default_role
    self.role ||= :standard
  end


  def skip_confirmation!
      self.confirmed_at = Time.now.utc
  end



end
