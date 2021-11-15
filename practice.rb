# frozen_string_literal: true

# class Practice
class Practice
  attr_reader :array_a, :array_b, :array_c

  # Вспомогательные функции
  ##########################################################################

  def array_init_2_dim(length, upper_bound)
    array = Array.new(length) { Array.new(length) { rand(upper_bound) } }
    array.map { |item| p item }
    puts
    array
  end

  # Одномерные
  ##########################################################################
  # task 1+
  # Вывести индексы массива в том порядке, в котором соответствующие им элементы
  # образуют возрастающую последовательность.
  def t11
    @array_a = Array.new(5) { rand(10) }
    p "Original array: #{@array_a}"
    @array_b = @array_a.clone.sort
    # array_2.sort!
    @array_c = []
    @array_b.each do |elm|
      index = @array_a.index(elm)
      @array_c.push(index)
      @array_a[index] = nil
    end
    p "Indexes of array: #{@array_c}"
  end
  # task 1-

  # task 2+
  # В численном массиве найти сумму отрицательных элементов.
  def t12
    @array_a = Array.new(5) { rand(10) }
    p @array_a
    @array_a.map! { |elm| rand(100) > 50 ? -elm : elm }
    p @array_a
    result = @array_a.inject(0) do |memo, obj|
      memo + (obj.negative? ? obj : 0)
    end
    p result
  end
  # task 2-

  # task 3+
  # Найти все индексы, по которым располагается максимальный элемент.
  def t13
    @array_a = Array.new(5) { rand(10) }
    p @array_a
    max = @array_a.max
    @array_c = []
    @array_a.each_with_index do |item, index|
      if item == max
        @array_c << index
        @array_a[index] = nil
      end
    end
    p @array_c
  end
  # task 3-

  # task 4+
  # В массиве переставить в начало элементы, стоящие на чётной позиции,
  # а в конец — стоящие на нечётной.
  def t14
    @array_a = Array.new(5) { rand(10) }
    p @array_a
    @array_b = []
    @array_c = []
    @array_a.each_with_index do |obj, i|
      if i.even?
        @array_b << obj
      else
        @array_c << obj
      end
    end
    p @array_b + @array_c
  end
  # task 4-

  # Двумерные
  ##########################################################################
  # task 1+
  # Поменять первый и последний столбец массива местами.
  def t21
    @array_a = array_init_2_dim(5, 10)
    @array_a = @array_a.transpose
    @array_a[0], @array_a[-1] = @array_a[-1], @array_a[0]
    @array_a = @array_a.transpose
    puts
    @array_a.map { |item| p item }
  end
  # task 1-

  # task 2+
  # Упорядочить N-ый столбец.
  def t22(col)
    @array_a = array_init_2_dim(5, 10)
    @array_a = @array_a.transpose
    @array_a[col].sort!
    @array_a = @array_a.transpose
    puts
    @array_a.map { |item| p item }
  end
  # task 2-

  # task 3+
  # Упорядочить строки, содержащие максимальный элемент.
  def t23
    @array_a = array_init_2_dim(5, 10)
    max = @array_a.map(&:max).max
    puts max
    @array_a.map { |item| item.sort! if item.include?(max) }
    @array_a.map { |item| p item }
  end
  # task 3-

  # task 4+
  # Упорядочить строки, если они не отсортированы и перемешать, если они
  # отсортированы.
  def t24
    @array_a = array_init_2_dim(5, 10)
    array_index = Array.new(2) { rand(5) }
    p array_index
    @array_a.each_with_index do |item, index|
      item.sort! if array_index.include?(index)
    end
    @array_a.map { |item| p item }
    puts
    @array_a.map! do |item|
      array_sort = item.sort
      if item.eql?(array_sort)
        item.shuffle!
      else
        item.sort!
      end
    end
    @array_a.map { |item| p item }
  end
  # task 4-

  # task 5+
  # Упорядочить строки массива по значению элемента главной диагонали в каждой
  # из строк (в исходном массиве).
  def t25
    @array_a = array_init_2_dim(5, 10)
    diagonal = []
    (0...@array_a.size).each { |i| diagonal << @array_a[i][i] }
    p diagonal
    puts
    array_index = (0...@array_a.size).sort_by { |v| diagonal[v] }
    p array_index
    puts
    result = []
    array_index.each { |item| result << @array_a[item] }
    result.map { |item| p item }
  end
  # task 5-

  # task 6+
  # Найти номера строк, элементы которых упорядочены по возрастанию.
  def t26
    @array_a = array_init_2_dim(5, 10)
    array_index = Array.new(3) { rand(5) }
    @array_a.each_with_index do |item, index|
      item.sort! if array_index.include?(index)
    end
    @array_a.map { |item| p item }
    puts
    sorted_items = []
    @array_a.each_with_index do |item, index|
      sorted_items << index if item.eql?(item.sort)
    end
    p sorted_items
  end
  # task 6-

  # Двумерные целочисленные
  ##########################################################################
  # task 1+
  # Найти максимальный элемент для каждого столбца, а затем получить произведение
  # этих элементов.
  def t31
    @array_a = array_init_2_dim(5, 10)
    res = @array_a.transpose.map(&:max).inject(1) do |result, item|
      result * item
    end
    p res
  end
  # task 1-

  # task 2+
  # Найти минимум в двумерном массиве.
  def t32
    puts array_init_2_dim(5, 10).flatten.min
  end
  # task 2-

  # task 3+
  # Найти произведение положительных элементов.
  def t33
    @array_a = array_init_2_dim(5, 10)
    @array_a.map! do |i|
      i.map! do |j|
        rand(100).odd? ? j * -1 : j
      end
    end
    @array_a.map { |item| p item }
    puts
    p @array_a.flatten.inject(1) { |memo, obj| obj.positive? ? memo * obj : memo }
  end
  # task 3-

  # task 4+
  # Найти сумму положительных элементов, больших К.
  def t34(max)
    @array_a = array_init_2_dim(5, 10)
    p @array_a.flatten!.inject(0) { |result, item|
      item > max ? result + item : result
    }
  end
  # task 4-

  # task 5+
  # Вычислить сумму и среднее арифметическое элементов главной диагонали.
  def t35
    @array_a = array_init_2_dim(5, 10)
    size = @array_a.size
    sum = 0.0
    (0...size).each { |n| sum += @array_a[n][n] }
    puts "sum #{sum}"
    puts "average #{sum / size}"
  end
  # task 5-

  # task 6+
  # Найти номера строк, все элементы которых — нули.
  def t36
    @array_a = array_init_2_dim(5, 10)
    @array_a.map! do |i|
      rand(100).even? ? i.map! { 0 } : i
      p i
    end
    puts
    array_zero = Array.new(@array_a.size, 0)
    @array_a.each_with_index do |obj, i|
      puts i + 1 if obj.eql?(array_zero)
    end
  end
  # task 6-

  # Ассоциативные массивы
  ##########################################################################
  # task 1+
  # Дан массив слов. Необходимо подсчитать, сколько раз встречается каждое слово
  # в массиве.
  def t41
    result = %w[Дан массив слов необходимо подсчитать количество разных слов]
             .each_with_object(Hash.new(0)) do |i, h|
      h[i] += 1
    end
    p result
  end
  # task 1-

  def main
    # t11
    # t12
    # t13
    # t14
    # t21
    # t22(1)
    # t23
    # t24
    # t25
    # t26
    # t31
    # t32
    # t33
    # t34(8)
    # t35
    # t36
    t41
  end
end
Practice.new.main
