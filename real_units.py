import re, sys
# <svg width="232mm" height="175mm"

f = sys.argv[1]
s = open(f).read()
s = re.sub(r'width="(\d+)"', r'width="\1 mm"', s)
s = re.sub(r'height="(\d+)"', r'height="\1 mm"', s)
open(f, 'w').write(s)


