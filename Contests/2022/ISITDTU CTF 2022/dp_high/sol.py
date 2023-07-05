from sage.all import *
from Crypto.Util.number import *
load("coppersmith.sage")

n = 12567364021021536069276139071081301321773783503415410122482063162815802632532262852631733566943908930876147793969043836275748336698486250666608690152319164539308799173942970880405365621942480869038031173565836135609803219607046250197218934622063531043191571238635559343630285434743137661162918049427668167596108116123813247574023489647941191092646108484359798178312183857161198552950237016232564837163103701319852345468700518013420435831423503394375188294692875472478236076844354332788143724582596188171429101120375457060113120938123836683660988201443089327738905824392062439034247838606482384586412614406834714072187
e = 302855054306017053454220113135236383717
c = 4891864668386517178603039798367030027018213726546115291869063934737584262406041165900191539273508747711632172112784295237035437771196319634059866827443546543304905951054697225192869131382430968922874630769470296997764149219967748222295126835357440172029624432839432442542014919311928847815297342723030801298870843985791566021870092065045427815279776382037308098892891521540483210118257005467504087917529931331454698510489305696908930175868148922286615019210097019743367080206300230172144203634385318929457785251214794930401419137018353777022634635240368493042317181737723067635048719777029127030494920756862174788399
dp_high = 1528682061327606941204027235121547734644486174542891631806426376137001818312801429494781262718713071077103179054205712581085921624900599327139049785998451580793229375262096344994664540984947702348067124539258177759586538935334513702134177319291812

if __name__ == '__main__':
    P = PolynomialRing(Zmod(n), "x, y"); x, y = P.gens()
    pol = dp_high * 2**205 + x + pow(e, -1, n) * (y - 1)
    bounds = (2**205, 2**128)
    # print(small_roots(pol, bounds, 1, 4)[0])

    xx, yy = 46715371176351361250281526788026186363748932743526846603000526, 12567364021021536069276139071081301321773783503415410122482063162815802632532262852631733566943908930876147793969043836275748336698486250666608690152319164539308799173942970880405365621942480869038031173565836135609803219607046250197218934622063531043191571238635559343630285434743137661162918049427668167596108116123813247574023489647941191092646108484359798178312183857161198552950237016232564837163103701319852345468700518013420435831423503394375188294692875472478236076844354332788143724582596188171429101120375457060113120938123836683660988201443089327738905824392062439034197704301738622479806959663002731988806
    p = gcd(pol.change_ring(ZZ).subs(x=xx, y=yy), n)
    q = n // p 
    d = inverse(e, (p - 1)*(q - 1))
    flag = long_to_bytes(ZZ(pow(c, ZZ(d), n)))

    print(f'[+] Flag: {flag.decode()}')