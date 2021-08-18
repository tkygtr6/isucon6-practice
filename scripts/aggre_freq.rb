puts "== search estate =="

items = [
  "rent",
  "door_height",
  "door_width ",
]

system("cat logs/mysql.log | grep 'FROM estate' | grep 'ORDER BY popularity DESC, id ASC' | grep -v ' OR ' | grep -v 'latitude' | grep -v 'longitude' | wc")

items.each do |item|
  puts "item: #{item}"
  system("cat logs/mysql.log | grep 'FROM estate' | grep 'ORDER BY popularity DESC, id ASC' | grep -v ' OR ' | grep -v 'latitude' | grep -v 'longitude' | grep #{item} | wc")
end

puts "== search chair =="

items = [
  "price",
  "height",
  "width",
  "depth",
  "color",
  "kind",
]

system("cat logs/mysql.log | grep 'FROM chair' | grep 'ORDER BY popularity DESC, id ASC' | grep -v ' OR ' | wc")

items.each do |item|
  puts "item: #{item}"
  system("cat logs/mysql.log | grep 'FROM chair' | grep 'ORDER BY popularity DESC, id ASC' | grep -v ' OR ' | grep #{item} | wc")
end

