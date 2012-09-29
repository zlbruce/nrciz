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
-- ������2��������ų�����������Ҫ�Խ��+1
isInPrime n
    | even n    = False
    | otherwise = S.member n allPrime

main = print $ (+1) . S.size $ S.filter isOk allPrime
