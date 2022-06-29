class Api::V1::Child < ApplicationRecord
    before_save :change_group_count
    has_many :guardians, dependent: :destroy, class_name: 'Api::V1::Guardian'
    has_one :group, class_name: 'Api::V1::Group'
    has_one :teacher, class_name: 'Api::V1::Teacher'
    belongs_to :group, class_name: 'Api::V1::Group'

    private

    def change_group_count
        group = Api::V1::Group.find(self.group_id)
        group.update_attribute(:children_count, (group.children.all.count + 1))
    end
end
