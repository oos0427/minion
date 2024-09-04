#Random 263p

import random
def random_pop(data):
    number = random.randint(0, len(data)-1)
    return data.pop(number)

if __name__ == "__main__":
    data = [1, 2, 3, 4, 5]
    while data:
        print(random_pop(data))

""" 
data 리스트는 처음에 [1, 2, 3, 4, 5]로 정의됩니다.
random_pop(data) 함수가 호출될 때, random.randint(0, len(data)-1)는 리스트의 길이(처음에는 5)에 따라 0에서 4 사이의 임의의 숫자를 생성합니다.
이 숫자가 4가 되면, data.pop(4)가 실행되어 리스트의 네 번째 인덱스에 있는 값인 5가 제거되고 반환됩니다.
이 반환된 값 5가 print() 함수에 의해 출력됩니다. 
"""