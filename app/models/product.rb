class Product < ActiveRecord::Base

  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :price, numericality: {greater_than: 0}


end
