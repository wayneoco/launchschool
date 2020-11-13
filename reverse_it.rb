def reverse(str)
  arr = str.split(" ")
  arr.each do |w|
    w.reverse! if w.length > 4
  end
  arr.join(" ")
end
