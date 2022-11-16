# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Creación de usuarios
# Lista de hashes para crear usuarios
users = [
  {email: 'paco@gmail.com', password: '123456'},
  {email: 'carlos@gmail.com', password: '123456'},
  {email: 'pedro@gmail.com', password: '123456'},
  {email: 'ermes@gmail.com', password: '123456'},
  {email: 'test@gmail.com', password: '123456'},
]

#Ciclo de creación de usuarios, en base a la lista de hashes
users.each { |user| User.create!(email: user[:email], password: user[:password]) }

# Creamos un template de tarea para asignar a los diferentes usuarios de la aplicación
def generateTask
  task = {
    title: Faker::Movies::HarryPotter.spell, 
    description: Faker::Movies::HarryPotter.quote,
    due_date: (Date.today - 5.days) + Random.rand(1..15), # Finaliza hoy más los dias que se agregen -x.days-
    priority: Random.rand(0..2), # Genera un numero aleatoria entre 0 y 2
    owner_id: Random.rand(1..5) # Genera un numero aleatoria entre 1 y 5 (El total de usuarios por defecto)
  }
end

200.times { Task.create!(generateTask) }