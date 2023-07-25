from Crypto.Util.number import long_to_bytes

x = 10715086071862673209484250490600018105614048117055336074437503883703510511249361224931983788156958581275946729175531468251871452856923140435984577574698574803934567774824230985421074605062371141877954182153046477020617917601884853827611232355455223966039590143622792803800879186033924150173912925208583
a = 31337
b = 66826418568487077181425396984743905464189470072466833884636947306507380342362386488703702812673327367379386970252278963682939080502468506452884260534949120967338532068983307061363686987539408216644249718950365322078643067666802845720939111758309026343239779555536517718292754561631504560989926785152983649035
n = 117224988229627436482659673624324558461989737163733991529810987781450160688540001366778824245275287757373389887319739241684244545745583212512813949172078079042775825145312900017512660931667853567060810331541927568102860039898116182248597291899498790518105909390331098630690977858767670061026931938152924839936

p, q, r = 2, 690712633549859897233, 651132262883189171676209466993073
assert n == p**63 * q**6 * r**5

Fp, Fq, Fr = Zmod(p^63), Zmod(q^6), Zmod(r^5)
y2 = (x^3 + a*x + b) % n

for mp in Fp(y2).nth_root(2, all=True):
    for mq in Fq(y2).nth_root(2, all=True):
        for mr in Fr(y2).nth_root(2, all=True):
            m = crt([ZZ(mp), ZZ(mq), ZZ(mr)], [p**63, q**6, r**5])
            flag = long_to_bytes(m)
            if b"CCTF{" in flag:
                print("Flag:", flag.decode())
                exit()