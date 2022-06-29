class Api::V1::Teacher < ApplicationRecord
    belongs_to :group, class_name: 'Api::V1::Group'
#    belongs_to :child, class_name: 'Api::V1::Child'
    belongs_to :user
end
