require "benchmark"

def fibonacci_good(n)
  raise ArgumentError, "n must be >= 0" if n < 0
  return n if n < 2

  two_previous = 0
  one_previous = 1
  num = 2

  while num < n
    temp = one_previous + two_previous
    two_previous = one_previous
    one_previous = temp
    num += 1
  end

  return one_previous + two_previous
end

def fibonacci_ok(n)
  raise ArgumentError, "n must be >= 0" if n < 0
  return n if n < 2

  list = Array(n)
  list[0] = 0
  list[1] = 1
  current_num = 2
  while current_num <= n
    list[current_num] = list[current_num - 1] + list[current_num - 2]
    current_num += 1
  end

  return list[n]
end

def fib_bad(n)
  raise ArgumentError, "n must be >= 0" if n < 0
  return n if n < 2

  return fib_bad(n - 1) + fib_bad(n - 2)
end

Benchmark.bm(50) do |bm|
  [2, 4, 8, 16, 32, 64].each do |current_num|
    answer = 0

    bm.report("Fibonacci_good(#{current_num})") do
      answer = fibonacci_good(current_num)
    end


    bm.report("Fibonacci_ok(#{current_num})") do
      answer = fibonacci_ok(current_num)
    end

    bm.report("Fibonacci_bad(#{current_num})") do
      answer = fib_bad(current_num)
    end
  end
end