class Good < ApplicationRecord
  belongs_to :staff, optional: true
end
