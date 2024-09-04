# Try finally 문
#  234p
try:
    f = open('foo.txt', 'w')

finally:
    f.close()