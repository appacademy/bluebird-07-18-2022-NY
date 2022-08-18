# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Like.destroy_all 
Chirp.destroy_all
User.destroy_all 
# destroy rows of data from the most dependent table
# hint of dependency would be looking for foreign keys in a model
# We want to delete anything in our database we were using to test to keep a consistent 

# Users
amin = User.create!(
    username: 'professor_of_logic', 
    email: "amin@aa.io"

)

spencer = User.create!(
    username: "spence_the_man", 
    email: "ballin@aa.io" 

)

kin = User.create!(
    username: 'kinster_the_man',
    email: 'kin@kingkin.com'

)

peter = User.create!(
    username: 'peter_bread',
    email: 'pita_bread@hotmail.com'

)

ayce = User.create!(
    username: 'ayce_in_space',
    email: 'ayce@gmail.com'

)

steve = User.create!(
    username: 'stevie',
    email: 'shteeviet@aa.io'

)

# Chirps
chirp1 = Chirp.create!(author_id: amin.id, body: 'Star Trek is wayyy better than Star Wars')
chirp2 = Chirp.create!(author_id: peter.id, body: 'Yer a lizard, Harry')
chirp3 = Chirp.create!(author_id: peter.id, body: 'LG is trash, yo')
chirp5 = Chirp.create!(author_id: steve.id, body: 'I got stuck on Abyss Watchers in DS3!')
chirp6 = Chirp.create!(author_id: kin.id, body: 'Just snowed in Vail, gonna hit the slopes today')
chirp7 = Chirp.create!(author_id: amin.id, body: 'Picard is the GOAT')
chirp8 = Chirp.create!(author_id: kin.id, body: 'Wish I could go surfing in CO')
chirp9 = Chirp.create!(author_id: peter.id, body: 'Going on a roadtrip!')
chirp10 = Chirp.create!(author_id: ayce.id, body: 'Has anyone seen my shoes?')

# Likes
# Peter's likes
Like.create!(liker_id: peter.id, chirp_id: chirp5.id)
Like.create!(liker_id: peter.id, chirp_id: chirp8.id)
Like.create!(liker_id: peter.id, chirp_id: chirp10.id)

# Peter's likes
Like.create!(liker_id: peter.id, chirp_id: chirp2.id)
Like.create!(liker_id: peter.id, chirp_id: chirp7.id)

# Ayce's likes
Like.create!(liker_id: ayce.id, chirp_id: chirp1.id)
Like.create!(liker_id: ayce.id, chirp_id: chirp2.id)
Like.create!(liker_id: ayce.id, chirp_id: chirp3.id)
Like.create!(liker_id: ayce.id, chirp_id: chirp6.id)
Like.create!(liker_id: ayce.id, chirp_id: chirp8.id)

# Steve's likes
Like.create!(liker_id: steve.id, chirp_id: chirp2.id)
Like.create!(liker_id: steve.id, chirp_id: chirp6.id)
Like.create!(liker_id: steve.id, chirp_id: chirp9.id)
Like.create!(liker_id: steve.id, chirp_id: chirp10.id)

# Kin's likes
Like.create!(liker_id: kin.id, chirp_id: chirp2.id)
Like.create!(liker_id: kin.id, chirp_id: chirp9.id)