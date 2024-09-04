# 05-2 모듈 mod1,py
def add(a, b):
    return a + b

def sub(a, b):
    return a - b



#mod2.py
PI = 3.141592

class Math:
    def solv(self, r):
        return PI * (r**2)
    
    def add(a, b):
        return a + b
    


# modtest.py
import mod2
result = mod2.add(3, 4)
print(result)
