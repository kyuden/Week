1.upto(300) do |idx|
 Comment.create(
  user_id: "#{idx}",
  body: "comment#{idx}",
  article_id: "#{idx % 10 + 1}"
  # created_at: "#{idx}/1/1",
  # updated_at: "#{idx}/1/1"
  )
end