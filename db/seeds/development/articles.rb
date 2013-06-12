1.upto(300) do |idx|
 Article.create(
  title: "title#{idx}",
  description: "des#{idx}",
  date: "#{idx}/1/1",
  comment_id: "#{idx}",
  user_id: "#{idx}",
  entry_id: "#{idx}",
  place_adress: "名古屋"
  # created_at: "#{idx}/1/1",
  # updated_at: "#{idx}/1/1"
  )
end