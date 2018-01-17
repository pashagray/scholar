class StudySubGroupStudent < ApplicationRecord
  belongs_to :user
  belongs_to :study_sub_group
end
