class Api::V1::Child < ApplicationRecord
    before_save :change_group_count

    has_one :group, class_name: 'Api::V1::Group'
    belongs_to :group, class_name: 'Api::V1::Group'
    has_one :teacher, class_name: 'Api::V1::Teacher'

    has_many :child_guardians, class_name: 'Api::V1::ChildGuardian'
    has_many :guardians, :through => :child_guardians
    private

    def change_group_count
        group = current_user.groups.find(self.group_id)
        group.update_attribute(:children_count, (group.children.all.count + 1))
    end
end
