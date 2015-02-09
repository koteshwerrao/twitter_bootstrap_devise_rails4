# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
guid = SecureRandom.hex(10)
secret = SecretCode.create(:secretcode => guid)
admin = User.new(
  email: 'admin@example.com',
  first_name: 'admin', 
  last_name: 'user', 
  role: 'admin', 
  password: 'adminuser',
  password_confirmation: 'adminuser',
  secretcode: "#{secret.secretcode}"
)
admin.save!
secret.user_id = admin.id
secret.save