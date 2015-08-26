class Comment < ActiveRecord::Base
  belongs_to :product

  validates :body, presence: {message: "body is required"},
                   uniqueness: {scope: :product_id}
end
