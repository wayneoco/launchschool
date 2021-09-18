def triangle(length, right_angle_orientation)
  case right_angle_orientation
  when :BR
    1.upto(length) do |x|
      puts ('*' * x).rjust(length)
    end
  when :BL
    1.upto(length) do |x|
      puts ('*' * x)
    end
  when :UR
    length.downto(1) do |x|
      puts ('*' * x).rjust(length)
    end
  when :UL
    length.downto(1) do |x|
      puts ('*' * x)
    end
  end
end

triangle(9, :BR)
