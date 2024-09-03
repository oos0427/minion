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
