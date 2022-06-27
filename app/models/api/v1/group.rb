class Api::V1::Group < ApplicationRecord
    has_many :children, dependent: :destroy, class_name: 'Api::V1::Child'
    belongs_to :user
end
