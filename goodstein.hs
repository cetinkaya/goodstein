-- 2014 - Ahmet Cetinkaya

increaseBase :: Int -> Int -> Int
increaseBase number base = increaseBase' number base 0 0
    where increaseBase' number base i acc
                            | number == 0 = acc
                            | otherwise = increaseBase' (div number base) base (i + 1) acc + ((base + 1) ^ (increaseBase i base)) * (rem number base)


goodsteinIterate :: Int -> Int -> Int
goodsteinIterate number base = (increaseBase number base) - 1


goodsteinSequence initialNumber initialBase
  | initialNumber == 0 = [0]
  | otherwise = initialNumber : (goodsteinSequence (goodsteinIterate initialNumber initialBase) (initialBase + 1))
