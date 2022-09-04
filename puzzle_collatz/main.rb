require 'set'

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

def run_random
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

#############################

# 2k+1 * 3 + 1 = 6k+4
# ((n - 1) / 3).odd? => (n - 1) / 3 % 2 == 1 => (n - 1) % 6 == 3 => n % 6 == 4

def run_beam
  hard_limit = LIMIT * 1_000
  beam_width = 20_000
  crt_gen = [ 1 ]
  best_score = 0
  best_number = -1
  score = 0

  cands = []
  while crt_gen.first < hard_limit
    next_gen = []
    crt_gen.each do |x|
      if x % 3 == 0
        cands << x
        cands.shift if cands.size > 100
        next
      end
      next_gen << 2 * x
      next_gen << (x - 1) / 3 if x % 6 == 4 && (x - 1) / 3 != 1
    end
    crt_gen = next_gen.sort.take(beam_width)
    score += 1
    if crt_gen.first < LIMIT && score > best_score
      best_score = score
      best_number = crt_gen.first
      puts score
    end
    puts "Beam = #{score}"
    puts "Cand size = #{cands.size}"
  end

  puts "Checking cands"
  cands.each do |x|
    steps = 0
    while 2 * x < LIMIT
      steps += 1
      x *= 2
    end
    crt_score = f(x)
    if crt_score > best_score
      best_score = crt_score
      best_number = x
      puts best_score
      # puts "Check", best_score, f(best_number)
    end
  end

  puts best_number
  puts best_score
  puts "Real score = ", f(best_number)
end

run_beam
