require 'faker'

# 5.times do |i|
#     name = '554 Mortimer - group ' + i.to_s
#     Api::V1::Group.create(name: name, user_id: 1, description: Faker::Restaurant.description)
# end

# rand(1..10).times do |i|
#     Api::V1::Group.all.each do |group|
#         Api::V1::Child.create(
#             first_name: Faker::Name.first_name,
#             last_name: Faker::Name.last_name,
#             teacher_id: 1,
#             group_id: group.id,
#             attendance_id: 1
#         )
#     end
# end

Api::V1::Group.all.each do |group|
    group.update_attribute(:children_count, group.children.count)
end