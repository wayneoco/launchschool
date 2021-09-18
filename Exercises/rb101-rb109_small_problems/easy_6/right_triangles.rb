# frozen_string_literal: true

def triangle_bottomright(num)
  spaces = num - 1
  num.times do
    stars = num - spaces
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1
  end
end

def triangle_topright(num)
  spaces = 0
  num.times do
    stars = num - spaces
    puts (' ' * spaces) + ('*' * stars)
    spaces += 1
  end
end

def triangle_topleft(num)
  spaces = 0
  num.times do
    stars = num - spaces
    puts ('*' * stars) + (' ' * spaces)
    spaces += 1
  end
end

def triangle_bottomleft(num)
  spaces = num - 1
  num.times do
    stars = num - spaces
    puts ('*' * stars) + (' ' * spaces)
    spaces -= 1
  end
end

def triangle(num, quadrant)
  case quadrant
  when :top_left     then triangle_topleft(num)
  when :top_right    then triangle_topright(num)
  when :bottom_left  then triangle_bottomleft(num)
  when :bottom_right then triangle_bottomright(num)
  end
end



triangle(5, :top_left)
triangle(5, :top_right)
triangle(5, :bottom_left)
triangle(5, :bottom_right)

triangle(9, :top_left)
triangle(9, :top_right)
triangle(9, :bottom_left)
triangle(9, :bottom_right)
