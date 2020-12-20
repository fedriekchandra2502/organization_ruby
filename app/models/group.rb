class Group < ApplicationRecord
    has_one_attached :logo
    has_many :group_has_pic, dependent: :destroy
    has_many :group_has_managers, dependent: :destroy
end
