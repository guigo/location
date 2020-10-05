require 'faker'
require 'factory_bot'

admin = User.find_or_create_by(name: 'Guilherme', email: 'guilherme.tr.silva@gmail.com', role: 0)
admin.password = '123456'
admin.save

36.times do |i|
  FactoryBot.create(:car)
end

2.times do |i|
  FactoryBot.create(:user, :admin)
end

6.times do |i|
  FactoryBot.create(:user, :regular)
end