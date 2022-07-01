require 'faker'

# 5.times do |i|
#     name = '554 Mortimer - group ' + i.to_s
#     Api::V1::Group.create(name: name, user_id: 1, description: Faker::Restaurant.description)
# end

# Api::V1::Group.all.each do |group|
#     teacher = Api::V1::Teacher.create(
#         first_name: Faker::Name.first_name,
#         last_name: Faker::Name.last_name,
#         user_id: 1,
#         group_id: group.id
#     )
#     group.update_attribute(:teacher_id, teacher.id)
#     rand(1..10).times do |i|
#         Api::V1::Child.create(
#             first_name: Faker::Name.first_name,
#             last_name: Faker::Name.last_name,
#             teacher_id: teacher.id,
#             group_id: group.id,
#             attendance_id: 1
#         )
#     end
# end

# Api::V1::Child.all.each do |child|
#     rand(1..3).times do |i|
#         first_name = Faker::Name.first_name
#         last_name = Faker::Name.last_name
#         full_name = first_name + ' ' + last_name
        
#         guardian = Api::V1::Guardian.create(
#             first_name: first_name,
#             last_name: last_name,
#             email: Faker::Internet.email(name: full_name, domain: 'gmail'),
#             phone_number: Faker::PhoneNumber.cell_phone,
#             child_id: child.id,
#             user_id: 1
#         )

#         Api::V1::ChildGuardian.create(
#             child_id: child.id,
#             guardian_id: guardian.id
#         )
#     end
# end

