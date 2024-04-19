# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

warrior1 = Warrior.create!(name: 'Conan', attack: 5, defense: 5, health: 100)
warrior2 = Warrior.create!(name: 'Thor', attack: 3, defense: 7, health: 100)
warrior3 = Warrior.create!(name: 'Hulk', attack: 1, defense: 9, health: 100)

item1 = Item.create!(name: 'Sword', damage: 5)
item2 = Item.create!(name: 'Axe', damage: 4)
item3 = Item.create!(name: 'Candycane', damage: 1)

Fight.create!(warrior1: warrior1, warrior2: warrior2).start
Fight.create!(warrior1: warrior1, warrior2: warrior3).start
Fight.create!(warrior1: warrior2, warrior2: warrior1).start
Fight.create!(warrior1: warrior2, warrior2: warrior3, warrior1_item: item3).start
