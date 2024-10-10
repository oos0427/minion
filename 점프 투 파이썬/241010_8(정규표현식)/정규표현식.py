# 정규 표현식 시작하기

# . ^ * + ? {} [] | ()

# 파이썬에서 정규 표현식을 지원하는 re 모듈

# 정규식을 이용한 문자열 검색

# match: 문자열의 처음부터 정규식과 매치되는지 조사

# search: 문자열 전체를 검색하여 정규식과 매치되는지 조사

import re
p = re.compile('[a-z]+')

m = p.match("3 python")
print(m) # 결과 None

s = p.search("3 python")
print(s) # 결과 <re.Match object; span=(2, 8), match='python'>

# findall 정규식과 매칭되는 모든 문자열을 리스트로 리턴한다.

result = p.findall("life is too short")
print(result) # 결과 ['life', 'is', 'too', 'short']

# finditer 정규식과 매칭되는 모든 문자열을 이터레이터 객체로 리턴한다.

result2 = p.finditer("life is too short")
print(result2) #결과 <callable_iterator object at 0x00000176700BAB60>
for r in result2: print(r)

#결과
# <re.Match object; span=(0, 4), match='life'>
# <re.Match object; span=(5, 7), match='is'>
# <re.Match object; span=(8, 11), match='too'>
# <re.Match object; span=(12, 17), match='short'>