# for fib numbers less than 100
# print the sum of all even valued numbers

class Array
  def sum
    inject(&:+)
  end
end

def fib(n)
  @fib    ||= {}
  @fib[n] ||= if n == 1 || n == 0
                1
              else
                fib(n-1) + fib(n-2)
              end
end


fibs = [fib(2)]
n = 3

while fibs.last < 4_000_000
  x = fib(n)
  n += 1
  next if x.odd?
  fibs << x
end

fibs.pop

puts fibs.join(", ")
puts fibs.sum