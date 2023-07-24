#!/usr/local/bin/sage

from Crypto.Util.number import long_to_bytes

n = 44538727182858207226040251762322467288176239968967952269350336889655421753182750730773886813281253762528207970314694060562016861614492626112150259048393048617529867598499261392152098087985858905944606287003243
enc = 37578889436345667053409195986387874079577521081198523844555524501835825138236698001996990844798291201187483119265306641889824719989940722147655181198458261772053545832559971159703922610578530282146835945192532
e = 31337

P.<k> = PolynomialRing(ZZ)
fp = k**6 + 7*k**4 - 40*k**3 + 12*k**2 - 114*k + 31377
fq = k**5 - 8*k**4 + 19*k**3 - 313*k**2 - 14*k + 14011
fk = fp*fq - n

_k, _ = fk.roots()[0]
p, q = fp(k=_k), fq(k=_k)

d = pow(e, -1, (p - 1)*(q - 1))
m = pow(enc, d, n)
flag = long_to_bytes(m)
print("Flag:", flag.decode())