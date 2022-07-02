class Api::V1::Guardian < ApplicationRecord
    after_create :create_child_guardian_relation

    has_many :child_guardians, class_name: 'Api::V1::ChildGuardian'
    has_many :children, :through => :child_guardians

    private
    def create_child_guardian_relation
        Api::V1::ChildGuardian.create(
            child_id: self.child_id,
            guardian_id: self.id
        )
    end
end
