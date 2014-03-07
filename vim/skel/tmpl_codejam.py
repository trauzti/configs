getint = lambda: int(raw_input())
getints = lambda: [int(z) for z in raw_input().split()]

for t in xrange(1, 1+getint()):
    l = getints()
    d = 0
    print "Case #%d: %d" % (t, d)
