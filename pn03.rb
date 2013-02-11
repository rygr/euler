#given prime numbers 5, 7, 13 and 29 in 13195

#What is the largest prime factor of number 600851475143
########

class Integer
  def prime?
    n = self.abs()
    return true if n == 2
    return false if n == 1 || n & 1 == 0
    d = n - 1
    d >>= 1 while d & 1 == 0

    20.times do
      a = rand(n-2) + 1
      t = d
      y = ModMath.pow(a, t, n)
      while t != n-1 and y != 1 and y != n-1
        y = (y * y) % n
        t <<= 1
      end
      return false if y != n-1 and t & 1 == 0
    end
    return true
  end
end

module ModMath
  def ModMath.pow(base, power, mod)
    result = 1
    while power > 0
      result = (result * base) % mod if power & 1 == 1
      base = (base * base) % mod
      power >>= 1
    end
    result
  end
end

factor_of = 600851475143
factors   = Array.new

1.upto(Math.sqrt(factor_of).ceil) do |num|
  if (factor_of % num).zero?
    factors.push(num)
    factors.push(factor_of/num)
  end
end

factors.sort.reverse.each do |factor|
  if factor.prime?
    puts factor
    break
  end
end
