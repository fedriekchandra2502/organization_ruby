class Group < ApplicationRecord
    has_one_attached :logo
    has_many :group_has_pic
end
