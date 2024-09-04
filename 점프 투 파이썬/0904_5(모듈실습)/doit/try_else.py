#  try_else 문
try:
    age = int(input("나이를 입력하시오"))

except:
    print('입력이정확하지않습니다')

else:
    if age <= 18:
        print('미성년자는 출입금지')
    else:
        print('환영합니다')
        