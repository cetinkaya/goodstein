# 2014 - Ahmet Cetinkaya

def increase_base(number, base)
  new_base = base + 1
  new_number = 0

  i = 0
  while number > 0
    new_number += (number % base) * (new_base ** increase_base(i, base))
    number /= base
    i += 1
  end

  new_number
end


def iterate(number, base)
  increase_base(number, base) - 1
end


def goodstein_sequence(initial_number, initial_base = 2)
  sequence = [initial_number]

  number = initial_number
  base = initial_base
  while true
    number = iterate(number, base)
    sequence<< number
    base += 1

    break if number == 0
  end

  sequence
end
