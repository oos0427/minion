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


# 키워드 매개변수
def print_kwargs(**kwargs):
    print(kwargs)
print_kwargs(a=1)

print_kwargs(name='foo', age=3)

# 함수의 리턴값은 언제나 하나이다.
def add_and_mul(a, b):
    return a+b, a*b

result = add_and_mul(3, 4)

print(result)

# RETURN 사용하기
a = 1
def vartest(a):
    a = a + 1
    return a
a = vartest(a)
print(a)

#lambda 예약어 170p
add = lambda a, b: a + b
result = add(3, 4)
print(result)

# 사용자 입출력 171p
a = input()
life is too short, you need python # a에 life is too short, you need python를 저장

number = input("숫자를 입력하세요: ") # 숫자를 입력하세요: 를 띄워서 입력값을 number 에 할당

#  한 줄에 결괏값 출력하기 174p
for i in range(10):
    print(i, end='')

# 파일 읽고 쓰기
f = open("c:/work/새파일.txt", 'w')
for i in range(1, 11):
    date = "%d번째 줄입니다.\n" % i
    f.write(date)
f.close()
