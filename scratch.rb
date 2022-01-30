def lenient_arity(array)
  array.each do |el|
    yield(el)
  end
end

lenient_arity([1, 2, 3]) { |num, index| p index }
