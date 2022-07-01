class Api::V1::Guardian < ApplicationRecord
    has_many :child_guardians, class_name: 'Api::V1::ChildGuardian'
    has_many :children, :through => :child_guardians
end
