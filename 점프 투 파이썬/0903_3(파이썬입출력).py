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

# read 함수 사용하기 180p
f = open("c:/work/새파일.txt", 'r')
date = f.read()
print(date)
f.close()

# 파일 객체를 for 문과 함께 사용하기
f = open("c:/work/새파일.txt", 'r')
for line in f:
    print(line)
f.close()

# 파일에 새로운 내용 추가하기
f = open("c:/work/새파일.txt", 'a')
for i in range(11, 20):
    data = "%d번째 줄입니다.\n" % i
    f.write(data)
f.close()

# with 문과 함께 사용하기
f = open("c:/work/foo.txt", 'w')
f.write("Life is short, you need python")
f.close() #원래라면 이런식으로 열고 닫고를 해줘야한다.

#자동으로 파일이 닫아짐 파일을 열때 경로를 지정하지 않았으므로 Idle파일이 있는 곳에 txt파일이  생성되는 것 확인
with open("foo.txt", "w") as f:
    f.write("life is short, you need python") 

#  각 요소를 실행시켜주는 sys파일 만들기 파일명을 sys1.py로 저장해야한다. p184
import sys

args = sys.argv[1:] #argv의 의미: argv는 "argument vector"의 약자로, 프로그램에 전달된 인수들의 리스트를 의미합니다.
for i in args:
    print(i)

#  입력 받은 문자를 대문자로 바꿔주는 프로글매 책에서는 sys2.py로 파일명 설정 p184
import sys

args = sys.argv[1:]
for i in args:
    print(i.upper(), end='')

# 문제 1
a = int(input())
b = int(input())
c = a + b
print(c)

# 문제 2
print("you" "need" "python")
print("you" + "need" + "python")
print("you", "need", "python")
print("".join(["you", "need", "python"]))
