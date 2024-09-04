# Try finally 문
try:
    f = open('foo.txt', 'w')

finally:
    f.close()