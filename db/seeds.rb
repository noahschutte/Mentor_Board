require 'faker'


def rand_num(num = 3)
  rand(1..num)
end

type = ['Student', 'Mentor']

jon = User.create!(first_name: 'Jon', last_name: 'Schwartz', email: 'jon@email.com', phone: '123456789', password: 'jon', phase: '2', type: 'Mentor')
theo = User.create!(first_name: 'Theo', last_name: 'Paul', email: 'theo@email.com', phone: '+64211149935', password: 'theo', phase: '1', type: 'Student')
noah = User.create!(first_name: 'Noah', last_name: 'Schutte', email: 'noah@email.com', phone: '987654321', password: 'noah', phase: '3', type: 'Mentor')


rand_num.times do
  first = Faker::Name.first_name
  last = Faker::Name.last_name
  full_name = "#{first} #{last}"
  User.create!(first_name: first, last_name: last, email: Faker::Internet.email(full_name), phone: Faker::PhoneNumber.phone_number, password: Faker::Internet.password, phase: rand_num, type: type.sample)
end


