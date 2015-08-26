class Product < ActiveRecord::Base
  validates :title, presence: true
  validates :price, numericality: {greater_than: 0}

  has_many :comments, dependent: :destroy

end
