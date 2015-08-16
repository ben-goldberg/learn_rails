# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all

Product.create!(
    title: 'Title',
    description: %{<p>
        Here is a super fancy description. Seriously, it's so fancy I can't believe it.
        </p>},
    image_url: 'image.jpg',
    price: 99.95
    )

Product.create!(
    title: 'Another one',
    description: %{<p>
        This description is super awesome. So awesome. Soooo awesome.
        </p>},
    image_url: 'image.jpg',
    price: 99.95
    )