class Project < ApplicationRecord
  belongs_to :assistant, class_name: "Staff", foreign_key: :assistant_id
  belongs_to :level2_assistant, class_name: "Staff", foreign_key: :level2_assistant_id
  belongs_to :level3_assistant, class_name: "Staff", foreign_key: :level3_assistant_id
end
