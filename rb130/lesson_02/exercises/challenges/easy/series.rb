class Series
  def initialize(number)
    @number = number
  end

  def slices(length)
    raise ArgumentError unless length <= @number.size

    digits = @number.split('')
    series = []
    digits.each_index do |idx|
      break if series.size == @number.size - (length - 1)

      series << digits.slice(idx, length).map(&:to_i)
    end
    series
  end
end
