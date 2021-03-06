class Category < ActiveRecord::Base

  has_many :categorizations, dependent: :destroy
  has_many :products, through: :categorizations

  validates :name, uniqueness: true, presence: true
end
