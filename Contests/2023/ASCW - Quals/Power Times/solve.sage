from Crypto.Util.number import *

(q, g, h, c1, c2) = (19642484293413852622846039011835737688979058041726081766372823421394227037190498969888862412181723195699650291887179278383676677726115498015393254563767601, 11, 15593938185930627718642639739509862473703377812603616036769253375027997124146932133733433651919618271694314214789449955526182978649267911629641850973460839, 4105562613589994845279013305495809723790809350154357479862476149573670003051800597050979882873292706903768355923782684472954956273442311325401031688217300, 9698058492428653862312636499383511171483446858813538219848992888851621152158266121435951717984680824058207898584790673405991899302786979690515541968032504)
order = 1
for p, e in factor(q - 1):
    if p < 2**33:
        order *= p**e

assert order > 2**256
F  = GF(q)

_h = pow(h, (q - 1)//order, q)
_g = pow(g, (q - 1)//order, q)
x  = discrete_log(F(_h), F(_g), operation='*')

m  = F(c2) / F(pow(c1, x, q))
print(long_to_bytes(ZZ(m)))
