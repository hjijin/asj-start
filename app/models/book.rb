class Book < ApplicationRecord
  belongs_to :staff, foreign_key: :borrow_id, optional: true
end
