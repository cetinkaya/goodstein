defmodule Goodstein do
  def pow(_, 0) do
    1
  end

  def pow(a, b) do
    a * pow(a, b - 1)
  end
  
  def increase_base(number, base, p \\ 0) do
    if number <= 0 do
      0
    else
      rem(number, base) * pow(base + 1, increase_base(p, base, 0)) + increase_base(div(number, base), base, p + 1)
    end
  end

  def iterate(number, base) do
    increase_base(number, base, 0) - 1
  end

  def sequence(0, _) do
    [0]
  end

  # Goodstein.sequence(6, 4) should give [6, 6, 6, 6, 5, 4, 3, 2, 1, 0]
  def sequence(initial_number, initial_base) do
    [initial_number | sequence(iterate(initial_number, initial_base), initial_base + 1)]
  end
end
