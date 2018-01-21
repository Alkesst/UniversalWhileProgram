module Codification(
    godelization,
    cantorization,
    degodelization,
    decantorization
) where


godelization :: [Integer] -> Integer
godelization xs
    | len == 0  = 0
    | otherwise = basicCantor (len - 1) (cantorization xs) + 1
        where
            len = longth xs

degodelization :: Integer -> Integer -> Integer
degodelization z k
    | z == 0 || k > (lungth z)  = 0
    | otherwise = decantorization (lungth z) k (basicDecantor22 (z - 1))


-- k <- num arguments given i <- element to select x <- cantorized
decantorization :: Integer -> Integer -> Integer -> Integer
decantorization 1 1 x  = x
decantorization _ 1 x  = basicDecantor21 x
decantorization 2 2 x  = basicDecantor22 x
decantorization k i x  = decantorization (k-1) (i - 1) (basicDecantor22 x)

basicDecantor22 :: Integer -> Integer -- decantor 1 2, 2
basicDecantor22 x = x - basicCantor d 0
    where d =  floor ((sqrt ((8 * (fromIntegral x ::Double) + 1)) - 1) / 2)

basicDecantor21 :: Integer -> Integer
basicDecantor21 x = d - basicDecantor22 x
    where d =  floor ((sqrt ((8 * (fromIntegral x ::Double) + 1)) - 1) / 2)

longth :: [Integer] -> Integer
longth []       = 0
longth (x:xs)   = 1 + longth xs

lungth :: Integer -> Integer -- function long
lungth 0 = 0
lungth z = basicDecantor21 (z-1) + 1

cantorization :: [Integer] -> Integer
cantorization [x]    = x
cantorization [x, y] = basicCantor x y
cantorization (x:xs) = basicCantor x (cantorization xs)
    where len = longth (x:xs)

basicCantor :: Integer -> Integer -> Integer
basicCantor x y = (x + y) * (x + y + 1) `div` 2 + y


integerSQRT :: Integer -> Integer
integerSQRT 0 = 0
integerSQRT 1 = 1
integerSQRT n = head $ dropWhile (\x -> x*x > n) $ iterate (\x -> (x + n `div` x) `div` 2) (n `div` 2)
