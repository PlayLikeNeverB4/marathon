# LIMIT = 10 ** 2
LIMIT = 10 ** 100

# Calculates the number of steps needed to reach 1
def f(n)
  cnt = 0
  while n > 1
    if n.even?
      n /= 2
    else
      n = 3 * n + 1
    end
    cnt += 1
    # puts "#{n} #{cnt}"
  end
  cnt
end

def random_gen_from_1
  prob = rand()
  # prob = 0.7

  n = 1
  cnt = 0
  # n = 7
  # cnt = 16
  while true
    if (n - 1) % 3 == 0 && ((n - 1) / 3).odd? && ((n - 1) / 3) != 1 && (rand() < prob || n * 2 >= LIMIT)
      n = (n - 1) / 3
    else
      break if n * 2 >= LIMIT
      n *= 2
    end
    cnt += 1
    # puts n
  end
  [n, cnt]
end

def run
  steps = 2
  best_n = 0
  best_cnt = 0

  update = lambda do |n, cnt|
    if cnt > best_cnt
      best_cnt = cnt
      best_n = n
      puts best_n, best_cnt
    end
  end

  while true
    # n = rand(LIMIT)
    # cnt = f(n)
    n, cnt = random_gen_from_1
    update.call(n, cnt)

    next if steps == 0
    (n-steps..n+steps).each do |nn|
      update.call(nn, f(nn))
    end
  end
  puts best_n, best_cnt
end

run
# n -= 1
# puts f(n)
# puts f(n)
