#  오류 예외 처리 기법
#  232 - 233p


try:
    4/0
except ZeroDivisionError as e:
    print(e)
    