require 'faker'
require 'factory_bot'

admin = User.find_or_create_by(name: 'Guilherme', email: 'guilherme.tr.silva@gmail.com', role: 0)
admin.password = '123456'
admin.save

100.times do |i|
  FactoryBot.create(:car)
end

10.times do |i|
  FactoryBot.create(:user, :admin)
end

100.times do |i|
  FactoryBot.create(:user, :regular)
end