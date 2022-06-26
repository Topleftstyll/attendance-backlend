class User < ApplicationRecord
  has_many :groups, dependent: :destroy, class_name: 'Api::V1::Group'

  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist
end