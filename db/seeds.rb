# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: 'jayshreeanand90@gmail.com', password: 'test1234')

project = Project.create(user: user, name: 'Omicode app', slug: 'omnicode')

account = Account.create(project: project, kind: 'android', uid: 'com.keepworks.omnicode')