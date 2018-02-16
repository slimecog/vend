# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
owner1 = Owner.create!(name: "saul")
owner2 = Owner.create!(name: "paul")

machine1 = Machine.create!(location: "denver", owner: owner1)
machine2 = Machine.create!(location: "austin", owner: owner2)

snack1 = Snack.create!(name: "tic tac", price: 1)
snack1 = Snack.create!(name: "twix", price: 2)

SnackMachine.create!(snack_id: 1, machine_id: 1)
SnackMachine.create!(snack_id: 2, machine_id: 2)
