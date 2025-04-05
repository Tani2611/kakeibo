class Category < ApplicationRecord
  has_many :lists, foreign_key: "category_id"
  has_many :payments, foreign_key: :category_id
end
