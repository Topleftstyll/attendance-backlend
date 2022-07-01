class Api::V1::ChildGuardian < ApplicationRecord
    belongs_to :child, class_name: 'Api::V1::Child'
    belongs_to :guardian, class_name: 'Api::V1::Guardian'
end