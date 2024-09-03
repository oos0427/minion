# 숫자 값을 나타내는 변수로 대입
number = 3
"I eat %d apples." % number

# 2개 이상 값넣기
number = 10
day = "three"
"I ate %d apples. so i was sick for %s days." % (number, day)

# %d 와 %를 같이 쓰고 싶을때 %는 %%로 표현
"Error is %d%%." % 98

# 정렬과 공백
"%10s" % "hi" #10개의 문자열 값을 오른쪽 정렬 ㅁㅁㅁㅁㅁㅁㅁㅁ h i
"%-10s" % "hi" #10개의 문자열 값을 왼쪽 정렬  h i ㅁㅁㅁㅁㅁㅁㅁㅁ

# format 함수를 사용한 포매팅
"I eat {0} apples.".format(3)

# 문자열 바로 대입하기
"I eat {0} apples".format("three")

# 2개 이상 값 넣기
number = 10
day = "three"
"I ate {0} apples. so I wat sick for {1} days.".format(number, day)

# 이름으로 넣기
" I ate {number} apples. so i was sick for {day} days.".format(number=10, day=3)

#공백 채우기
"{0:=^10}".format("hi") 

#  문자열 관련 함수들
a = "hobby"
a.count('b') # b의 개수를 찾아줌

#  위치알려주기 find index
a = "Python is the best choice"
a.find('b')
a.find('k') # 존재하지 않는 경우 -1로 반환

#  join 다음 문자열 사이에 "0" 0값을 삽입
",".join('abcd')
",".join(['a', 'b', 'c', 'd'])

#  인덱싱
a = [1, 2, 3]
a
a[0]
a[0] + a[2]
a[-1]

a= [1, 2, 3, ['a', 'b', 'c']]
a[0]
a[-1]
a[3]
a[-1][0]

#  삼중구조
a = [1, 2, ['a', 'b', ['life', 'is']]]
a[2][2][0]

# 리스트의 슬라이싱 []
a = [1, 2, 3, 4, 5]
a[0:2]

a = "12345"
a[0:2]

#  튜블 ()

# 딕셔너리  {}
dic = {'name':'pey', 'phone':'010-0000-0000', 'birth':'1118'}
dic['name']
a = {1: 'h1'}

# 집합자료형
s1 = set([1, 2, 3])
s1

s2 = set("hello")
s2

s1 = set([1, 2, 3, 4, 5, 6])
s2 = set([4, 5, 6, 7, 8, 9])
s1 & s2  #교집합
s1 | s2  #합집합
s1 - s2  #차집합
s2 - s1  #차집합

#  type() 자료 형태 확인
a = True
type(a)

# 불 자료형 참과 거짓을 나타내는 자료형
1 == 1
2 > 1

