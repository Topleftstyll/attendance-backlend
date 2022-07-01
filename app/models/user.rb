class User < ApplicationRecord
  has_many :groups, dependent: :destroy, class_name: 'Api::V1::Group'
  has_many :teachers, dependent: :destroy, class_name: 'Api::V1::Teacher'
  has_many :guardians, dependent: :destroy, class_name: 'Api::V1::Guardian'

  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist
end