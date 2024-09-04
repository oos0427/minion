# itertools.zip_longest(*iterables, fillvalue=None) 
# 같은 개수의 자료형을 묶는 파일
# 265p

import itertools

students =['한민서', '황지민', '이영철', '이광수', '김승민']
snacks = ['사탕', '초콜릿', '젤리']

result = itertools.zip_longest(students, snacks, fillvalue='새우깡')
print(list(result))
