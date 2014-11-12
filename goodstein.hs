-- 2014 - Ahmet Cetinkaya

increaseBase :: Integer -> Integer -> Integer
increaseBase number base = increaseBase' number base 0 0
    where increaseBase' number base i acc
                            | number == 0 = acc
                            | otherwise = increaseBase' (div number base) base (i + 1) acc + ((base + 1) ^ (increaseBase i base)) * (rem number base)


goodsteinIterate :: Integer -> Integer -> Integer
goodsteinIterate number base = (increaseBase number base) - 1


goodsteinSequence :: Integer -> Integer -> [Integer]
goodsteinSequence initialNumber initialBase
  | initialNumber == 0 = [0]
  | otherwise = initialNumber : (goodsteinSequence (goodsteinIterate initialNumber initialBase) (initialBase + 1))
