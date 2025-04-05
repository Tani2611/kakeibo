class Payment < ApplicationRecord
  belongs_to :category, optional: true
end
