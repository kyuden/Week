name = %w(yoko honda tanaka kouhei)
location = %w(1, 2, 3 )
age = %w(20, 21)
gender = %w(male, female)

1.upto(300) do |idx|
  User.create(
    uid: idx,
    access_token: "CAACNXToBLcQBACgh7trtH8g0MclkfbQc34dryxkOZCEMIflRHH",
    name: "taro #{idx}",
    email: "#{idx}@example.com",
    gender: gender[idx % 2],
    image: "http://graph.facebook.com/100005799161180/picture?t...",
    url: "http://www.facebook.com/naoto.honda.50",
    location: location[idx % 3],
    age: age[idx % 2]
    )
end