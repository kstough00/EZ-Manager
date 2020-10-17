# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

artists = Artist.create([{ name: 'Kyle' }, { name: 'Duke' }])
stages = Stage.create([{ name: 'Main Stage', capacity: 1000 }, { name: 'riverview', capacity: 500}])
performances = Performances.create([{ duration: 20, description: 'nice'}])
user = User.create(username: 'kyle', password: 'password', password_confirmation: 'password')
user.performances.build(name: 'ceed performance 1').performances << [Performances.create(duration: 15, stage: 'Main Stage'), Performance.create(duration: 10, stage: 'Main Stage', description: 'nice')]