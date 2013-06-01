name = %w(yoko honda tanaka kouhei)
location = %w(1, 2, 3 )
age = %w(20, 21)
gender = %w(male, female)

1.upto(300) do |idx|
  User.create(
    uid: 100006044191928,
    access_token: "CAACNXToBLcQBAJX1Dc6UtjPL4cBQXIjLA4ydhZBPGLb5bZB4ICGU9N7P2bKtUaEgTAktWjS7J3HHxAD8AzesKREm5iaPxKJUh309A8V6IGfNO8LMhPO1RwvqXUtAJZBJNyjZAs4ZABAtu1zaBAkEnNvrYecWPNw4ZD",
    name: "kyutaro #{idx}",
    email: "#{idx}@example.com",
    gender: gender[idx % 2],
    image: "http://graph.facebook.com/100006044191928/picture?type=square",
    url: "http://www.facebook.com/msmsms.um",
    location: location[idx % 3],
    age: age[idx % 2]
    )
end