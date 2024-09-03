def add(a, b):
    return a + b

a = 3
b = 4
c = add(a, b)
print(c)

def add_many(*args):
    result = 0
    for i in args:
        result = result + i
    return result

result = add_many(1, 2, 3)
print(result)
