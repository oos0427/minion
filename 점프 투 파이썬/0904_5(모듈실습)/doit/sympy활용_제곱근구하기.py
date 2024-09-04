import sympy

a = int(input("제곱근을 구할 수를 입력하시오 : "))

x = sympy.symbols("x")
f = sympy.Eq(x ** 2, a)
print(sympy.solve(f))