info = [["Launch School", "Online"], ["Wicked Witch", "The West"], ["Kermit the Frog", "Swamp"], ["Big Bird", "Sesame Street"], ["Ghostbusters", "Manhattan"]]

mapped_info = (info.map do |item1|
  item1.select do |item2|
    item2.chars.each do |item3|
      puts item3
    end
  end
end)

puts mapped_info == info


# item1 = each nested array within the array (e.g., ["Launch School", "Online"]
# item2 = each item within the item1 array (e.g., "Launch School"]
# item3 = each letter within the array of characters in item2 (e.g., "L")

# Item heirarchy:
- map >>> [["Launch School", "Online"], ["Wicked Witch", "The West"], ["Kermit the Frog", "Swamp"], ["Big Bird", "Sesame Street"], ["Ghostbusters", "Manhattan"]]
- select >>> ["Launch School", "Online"]
- each >>> [L, a, u, n, c, h, , S, c, h, o, o, l].each returns self
