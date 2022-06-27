class Api::V1::Child < ApplicationRecord
    belongs_to :group, dependent: :destroy, class_name: 'Api::V1::Group'
end
