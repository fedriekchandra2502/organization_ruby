class GroupHasPic < ApplicationRecord
  belongs_to :group
  has_one_attached :avatar
end
