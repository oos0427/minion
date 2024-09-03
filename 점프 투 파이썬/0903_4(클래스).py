# 클래스 190p
# 사칙연산 클래스
class FourCal:
    def setdata(self, first, second):
        self.first = first
        self.second = second
    
    def add(self):
        result = self.first + self.second
        return result
    
    def mul(self):
        result = self.first * self.second
        return result
    
    def sub(self):
        result = self.first - self.second
        return result

    def div(self):
        result = self.first / self.second
        return result

# 실행 후 다음 값 입력
a = FourCal()
b = FourCal()
a.setdata(4, 2)
b.setdata(3, 8)
a.add()
6 # 실행값
a.sub()
2 # 실행값
a.mul()
8 # 실행값
a.div()
2.0 # 실행값
b.add()
11 # 실행값

class FourCal:
    def __init__(self, first, second):
        self.first = first
        self.second = second
    
    def add(self):
        result = self.first + self.second
        return result
    
    def mul(self):
        result = self.first * self.second
        return result
    
    def sub(self):
        result = self.first - self.second
        return result

    def div(self):
        result = self.first / self.second
        return result
#  실행 후 다음 값 입력
a = FourCal(4, 2)
a.add()
6 #실행값

class FourCal:
    def __init__(self, first, second):
        self.first = first
        self.second = second

    def setdata(self, first, second):
        self.first = first
        self.second = second
        
    def add(self):
        result = self.first + self.second
        return result
    
    def mul(self):
        result = self.first * self.second
        return result
    
    def sub(self):
        result = self.first - self.second
        return result

    def div(self):
        result = self.first / self.second
        return result