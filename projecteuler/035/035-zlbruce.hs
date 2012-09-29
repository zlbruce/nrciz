import Data.List
import Data.Numbers.Primes
import qualified Data.IntSet as S

rotations n = foldl genR [n] [1..nLen - 1]
    where 
        nLen = length $ show n
        genR res num = n' : res
          where n'     = m * (10 ^ (nLen - num)) + d
                (d, m) = n `divMod` (10 ^ num)

allPrime = S.fromList $ takeWhile (<1000000) primes

isOk = and . map isInPrime . rotations

-- ��Ȼ����1,3,5,7��ɵ���
isInPrime n
    | even n && n > 2 = False
    | otherwise       = S.member n allPrime

main = print $ S.size $ S.filter isOk allPrime
