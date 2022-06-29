class Api::V1::Guardian < ApplicationRecord
    belongs_to :child, dependent: :destroy, class_name: 'Api::V1::Child'
end
