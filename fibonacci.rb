# frozen_string_literal: true

def fib(num)
  if num < 2
    num
  else
    fib(num - 1) + fib(num - 2)
  end
end
n = 20
start = Time.now
# puts fib(ARGV[0].to_i)
puts fib(n)
puts Time.now - start
