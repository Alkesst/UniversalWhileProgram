module WhileLang(
    WhileLang
) where
-- Var number
data X = X Int deriving Show
data Assig = Zero X | Var X X | Add X X | Dif X X deriving Show
-- Zero X assigns Xi to 0
-- Var X assigns Xi to Xj
-- Add X assigns Xi to Xj + 1
-- Dix X assigsn Xi to Xj - 1
data S = While X | Assi Assig | Od deriving Show
-- While Xi /= 0 do
--  <Assi code>
-- od
type WhileLang = (Int, Int, [S])
-- n input vars, p program vars, [S] cod_While

codWhile :: WhileLang -> [S]
codWhile (n, p, xs) = xs

inputVars :: WhileLang -> Int
inputVars (n, p, xs) = n

programVars :: WhileLang -> Int
programVars (n, p, xs) = p

--------------------------------------------------------------------------------
-- Example of a While Program
-- While X1 /= 0 do
--    X1 = X1 - 1
-- od
--------------------------------------------------------------------------------
a :: WhileLang
a = (1, 1, [While (X 1), Assi (Dif (X 1) (X 1)), Od])
