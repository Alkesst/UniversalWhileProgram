module WhileLang(
    WhileLang,
    codWhile,
    inputVars,
    programVars,
    codi,
    mediumCodi,
    bigCODI
) where
import Codification
-- Var number
data X = X Integer deriving Show
data Assig = Zero X | Var X X | Add X X | Dif X X deriving Show
-- Zero X assigns Xi to 0
-- Var X assigns Xi to Xj
-- Add X assigns Xi to Xj + 1
-- Dix X assigsn Xi to Xj - 1
data S = While X [S] | Assi Assig deriving Show
-- While Xi /= 0 do
--  <Assi code>
-- od
type WhileLang = (Integer, Integer, [S])
-- n input vars, p program vars, [S] cod_While

codWhile :: WhileLang -> [S]
codWhile (n, p, xs) = xs

inputVars :: WhileLang -> Integer
inputVars (n, p, xs) = n

programVars :: WhileLang -> Integer
programVars (n, p, xs) = p


-- codi : cod_While -> N
codi :: S -> Integer
codi (Assi (Zero (X i)))       = 5*(i-1)
codi (Assi (Var (X i) (X j)))  = 5*(cantorization [i-1, j-1]) + 1
codi (Assi (Add (X i) (X j)))  = 5*(cantorization [i-1, j-1]) + 2
codi (Assi (Dif (X i) (X j)))  = 5*(cantorization [i-1, j-1]) + 3
codi (While (X i) s)           = 5*(cantorization [i-1, (mediumCodi s)]) + 4

mediumCodi :: [S] -> Integer
mediumCodi [] = 0
mediumCodi x  = godelization [ codi x' | x' <- x ] - 1

-- CODI : WHILE -> N
bigCODI :: WhileLang -> Integer
bigCODI (n, p, s) = cantorization [n, p - (max d n), mediumCodi s]
    where
        d = maxVar s 0

maxVar :: [S] -> Integer -> Integer
maxVar [] m                               = m
maxVar ((Assi (Zero (X i))):xs) m         = maxVar xs (max i m)
maxVar ((Assi (Var (X i) (X j))):xs) m    = maxVar xs (maximum [i, m, j])
maxVar ((Assi (Add (X i) (X j))):xs) m    = maxVar xs (maximum [i, m, j])
maxVar ((Assi (Dif (X i) (X j))):xs) m    = maxVar xs (maximum [i, m, j])
maxVar ((While (X i) s):xs)          m    = maxVar xs (maximum [i, m, maxVar s 0])

sentence :: Integer -> Integer
sentence z = z `mod` 5

extract :: Integer -> Integer -> Integer
extract z i = if (sentence z) == 0 then 1 + z `div` 5
    else 1 + decantorization 2 i d
        where
            d = (z - (sentence z)) `div` 5

--------------------------------------------------------------------------------
-- Example of a While Program
-- While X1 /= 0 do
--    X1 = X1 - 1
-- od
-- Solution to mediumCodi: 274
-- 5 * cantorization [0, (godelization [codi (Assi (Dif (X 1) (X 1)))] - 1)] + 4
--------------------------------------------------------------------------------
a :: WhileLang
a = (1, 1, [While (X 1) [Assi (Dif (X 1) (X 1))]])
