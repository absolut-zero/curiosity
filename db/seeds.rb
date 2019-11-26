# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "Clearing all sesion answers..."
SessionAnswer.destroy_all

p "Clearing all revision sessions..."
RevisionSession.destroy_all

p "Clearing all concept tags..."
ConceptTag.destroy_all

p "Clearing all tags..."
Tag.destroy_all

p "Clearing all concepts..."
Concept.destroy_all

p "Clearing all documents..."
Document.destroy_all

p "Clearing all folders..."
Folder.destroy_all

p "Clearing all users..."
User.destroy_all

p "Creating new users..."

sophie = User.create!(
  first_name: "Sophie",
  last_name: "Lejeune",
  email: "sophie@student.com",
  password: "password",
  password_confirmation: "password",
)

maddy = User.create!(
  first_name: "Maddy",
  last_name: "Long",
  email: "maddy@student.com",
  password: "password",
  password_confirmation: "password",
)

ameya = User.create!(
  first_name: "Ameya",
  last_name: "Akhouri",
  email: "ameya@student.com",
  password: "password",
  password_confirmation: "password",
)
