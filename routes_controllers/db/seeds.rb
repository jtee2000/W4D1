# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Artwork.destroy_all 
User.destroy_all 
ArtworkShare.destroy_all 

corey = User.create(username: "corey123")
jason = User.create(username: "jtee20-00")


monalisa = Artwork.create(artist_id: 1, title: "Mona Lisa", image_url: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2019/04/26/15/mona-lisa-2.jpg")
lastsupper = Artwork.create(artist_id: 2, title: "Last Supper", image_url: "https://images-na.ssl-images-amazon.com/images/I/71U4WPakgqL._SX425_.jpg")

share_mona = ArtworkShare.create(artwork_id: 1, viewer_id: 2)
share_supp = ArtworkShare.create(artwork_id: 2, viewer_id: 1)