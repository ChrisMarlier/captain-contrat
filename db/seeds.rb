# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Warrior.create!(name: 'Conan', attack: 10, defense: 5, health: 100)
Warrior.create!(name: 'Thor', attack: 8, defense: 7, health: 100)

Fight.create!(warrior1: Warrior.first, warrior2: Warrior.last).start