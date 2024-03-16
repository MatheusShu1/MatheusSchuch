# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "-----------------------------------------------"
puts "Iniciando a criação de registros no banco de dados"

puts "-----------------------------------------------"
puts "Deletando registros antigos"
User.destroy_all
Person.destroy_all
Debt.destroy_all

puts "-----------------------------------------------"
puts "Criando registros"
User.create email: 'admin@admin.com', password: '111111'


3000.times do
  User.create email: Faker::Internet.email, password: Faker::Internet.password
end

puts " Usuários criados!"

3000.times do 
  Person.create!(
    name: Faker::Name.name,
    phone_number: Faker::PhoneNumber.phone_number,
    national_id: CPF.generate,
    active: [true, false].sample,
    user: User.order('random()').first
  )
end

puts "-----------------------------------------------"
puts " Pessoas criadas!"

3000.times do
Debt.create!(
  amount: Faker::Number.decimal(l_digits: 2),
  person: Person.order('random()').first,
  observation: Faker::Lorem.sentence
)
end
puts "-----------------------------------------------"
puts " Dívidas criadas!"

puts "-----------------------------------------------"
puts "Usuário padrão criado:"
puts "Usuário criado:"
puts "login admin@admin.com"
puts "111111"

