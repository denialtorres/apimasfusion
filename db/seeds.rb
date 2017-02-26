# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Property.create!(type: 0, title: 'Departamento en Colonia Americana', address: 'Marsella 23, colonia Americana. Guadalajara, Jalisco', zipcode: 44843, country: 'mx', notes: 'Sobre Avenida Juárez')
Property.create!(type: 1, title: 'Departamento Centro', address: 'Calle Nueva 123. Guadalajara, Jalisco', zipcode: 45643, country: 'mx', notes: 'En una esquina')
