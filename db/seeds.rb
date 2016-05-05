require 'faker'

def true_or_false
  [true, false].sample
end

def rand_num(lower = 1,upper = 3)
  rand(lower..upper)
end

def random_hour
  rand(8..20)
end

def random_half_hour
  [":00",":30"].sample
end

def random_time
  "#{random_hour} #{random_half_hour}"
end

def all_students_id
  Student.all.map do |student|
    student.id
  end
end

def random_student_id
  Student.all.sample.id
end

def all_mentors_id
  Mentor.all.map do |mentor|
    mentor.id
  end
end

def random_mentor_id
  Mentor.all.sample.id
end

def assign_other_user_id(user_id, all_user_ids)
  random_id = all_user_ids.sample
  if user_id == random_id
    assign_other_user_id(user_id, all_user_ids)
  else
    return random_id
  end
end

type = ['Student', 'Mentor']

#The Three Musketeers

jon = User.create!(first_name: 'Jon', last_name: 'Schwartz', email: 'jon@email.com', phone: '123456789', password: 'jon', phase: '2', type: 'Mentor')
theo = User.create!(first_name: 'Theo', last_name: 'Paul', email: 'theo@email.com', phone: '+64211149935', password: 'theo', phase: '1', type: 'Student')
noah = User.create!(first_name: 'Noah', last_name: 'Schutte', email: 'noah@email.com', phone: '987654321', password: 'noah', phase: '3', type: 'Mentor')

#Seed Users

rand_num.times do
  first = Faker::Name.first_name
  last = Faker::Name.last_name
  full_name = "#{first} #{last}"
  User.create!(first_name: first, last_name: last, email: Faker::Internet.email(full_name), phone: Faker::PhoneNumber.phone_number, password: Faker::Internet.password, phase: rand_num, type: type.sample)
end

#Seed Appointments

# could improve this logic by adding randomness to whether a student has signed up to a mentors session/appointment or not.
# also I think having a snake booking (booking sessions in succession) would be pretty sweet

rand_num(10, 20).times do

  Appointment.create!(
    date: Date.today,
    time: random_time,
    mentor_id: random_mentor_id,
    student_id: random_student_id
    )

end

# Seed Reviews

apps = Appointment.all
app_mentor_ids = apps.map do |app|
  app.mentor_id
end

app_student_ids = apps.map do |app|
  app.student_id
end

apps.each_with_index do |app, index|
  # random mentor review of the session
  if true_or_false
    Review.create!(
      rating: rand_num(1,5),
      content: Faker::Hipster.paragraph,
      author_id: app_mentor_ids[index],
      appointment_id: app.id
      )
  end
  # random student review of the session
  if true_or_false
    Review.create!(
      rating: rand_num(1,5),
      content: Faker::Hipster.paragraph,
      author_id: app_mentor_ids[index],
      appointment_id: app.id
      )
  end
end




