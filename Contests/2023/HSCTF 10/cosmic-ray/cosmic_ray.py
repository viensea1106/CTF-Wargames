p = ##########################################################
q = ##########################################################
n = p * q
m = ##########################################################
e = ##########################################################
d = ##########################################################

cache = []

def exp(a, b, n):
	if b == 0:
		return 1
	pwr = exp(a, b//2, n)
	pwr *= pwr
	if b & 1:
		pwr *= a
	pwr %= n
	cache.append(pwr)
	return pwr

def cosmic_ray():
    ##########################################################

def clear():
	for i in range(len(cache)):
		if cosmic_ray():
			continue
		cache[i] = 0

c = exp(m, e, n)
clear()