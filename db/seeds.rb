# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

parts_names = %w(腕 肩 胸 背中 上半身 下半身)
parts_names.each do |parts_name|
  Muscle.create(part: parts_name)
end