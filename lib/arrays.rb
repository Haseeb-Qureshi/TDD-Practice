class Array

  def my_uniq
    inject(Hash.new(0)) { |counts, el| counts[el] += 1; counts }.keys
  end

  def two_sum
    (0...length).to_a.combination(2).select { |x, y| self[x] + self[y] == 0 }
  end

  def my_transpose
    transposed = Array.new(size) { Array.new(first.length) }
    each_with_index do |arr, i|
      arr.each_with_index do |num, j|
        transposed[j][i] = num
      end
    end
    transposed
  end

  def stock_picker
    (0...length).to_a.combination(2).max_by { |x, y| self[y] - self[x] }
  end
end
