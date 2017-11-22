require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Category.delete_all
User.delete_all
Company.delete_all
Machine.delete_all

addresses = [
  "R. Cais de Santarém 36 lisbon",
  "Largo São Sebastião da Pedreira 31 lisbon",
  "Av. Sidónio Pais 16 lisbon",
  "R. António Pedro 1 lisbon",
  "Av. Alm. Reis 238 lisbon",
  "Rua Coelho da Rocha 69 lisbon",
  "Av. António Augusto de Aguiar 58 lisbon",
  "Rua das Portas de Santo Antão 27 lisbon",
  "Av. Duque de Loulé 1 lisbon",
  "Avenida 5 de Outubro 70 lisbon",
  "Rua José Estêvão 47 lisbon",
  "Rua do Salitre 185 lisbon",
  "R. Anchieta 5 lisbon",
  "Avenida Berna 35 lisbon",
  "Av. Miguel Bombarda 145 lisbon",
  "R. Rodrigo da Fonseca 82A lisbon",
  "Rua de Xabregas 20 lisbon",
  "Praça Ilha do Faial 13 lisbon",
  "R. Nova de São Mamede 56 lisbon",
  "Av. Alm. Reis 65 lisbon",
  "Travessa de S. Plácido 50A lisbon",
  "Av. Da Liberdade 127 lisbon",
  "Largo de São Carlos 10 lisbon",
  "Rua dos Prazeres 52 lisbon",
  "Av. Almirante Reis 1 lisbon",
  "R. Trinas 129 lisbon",
  "R. Paz 80 lisbon",
  "Largo da Trindade 9 lisbon",
  "R. do Teixeira 35 lisbon",
  "R. Telhal 75 lisbon",
  "R. Dom Pedro V 129 lisbon",
  "Rua da Prata 52 lisbon",
  "Calçada Santana 41 lisbon",
  "Tv. Do Convento das Bernardas 12 lisbon",
  "Rua do Loreto 21 lisbon",
  "R. das Portas de Santo Antão 23 lisbon",
  "R. Mal. Saldanha 1 lisbon",
  "R. da Palmeira 15 lisbon",
  "Rua do Salitre 117 lisbon",
  "Largo da Academia Nacional de Belas Artes 18-20 lisbon",
  "R. da Palmeira 15 lisbon",
  "Tv. Do Convento das Bernardas 12",
  "Tv. De Santo Antão 11 lisbon",
  "R. Duques de Bragança 7 lisbon",
  "Rua da Glória 43 lisbon",
  "Praça dos Restauradores 79 lisbon",
  "R. do Norte 17 lisbon",
  "R. da Misericórdia 37 lisbon",
  "1150, R. São José 182 lisbon",
  "R. de São Pedro Mártir 23 lisbon",
  "R. São Pedro de Alcântara 81 lisbon",
  "Av. Da Liberdade 185 lisbon",
  "R. de São Lourenço 5 lisbon",
  "R. Guia 9 lisbon",
  "Calçada do Duque 31B lisbon",
  "Largo da Graça 95-96 lisbon",
  "Largo do Carmo 10 lisbon",
  "Rua da Betesga 3 lisbon",
  "Rua da Alegria 23 lisbon",
  "Rua da Boavista 16 lisbon",
]


users = []
6.times do
  new_user = User.new(
    email: Faker::Internet.email,
    password: "123456",
    )
  new_user.save
end

1.times do 
  new_company = Company.new(
    name: "Delta Cafe",
    email: "deltacafe@delta.com",
    password: "123456",
    )
  new_company.save

  addresses.each do |address|
    new_machine = Machine.new(
      address: addresses.shuffle.pop,
      company_id: new_company.id
      )
    new_machine.save
  end

end


# beverages = Category.new(name: "Beverages")
# beverages.save
# coffee = Category.new(name: "Coffee")
# coffee.save
# snacks = Category.new(name:"Snacks")
# snacks.save
# candy = Category.new(name: "Candy")
# candy.save

# # has_attachement :photo
# url = "http://img.clubic.com/07791435-photo-playstation.jpg"
# product = Product.new(name: 'Playstation')
# product.save!
# product.photo_url = url # Upload happens here

# # has_attachement :photos  (many)
# urls = [
#   'http://img.clubic.com/08254724-photo-xbox-console.jpg',
#   'http://compass.xbox.com/assets/a5/d3/a5d3e0e4-38fd-42ab-90f4-e7b5112af4d1.png'
# ]

# product = Product.new(name: 'Xbox')
# product.save!
# product.photo_urls = urls # Multi-upload happens here




