# 게시판 페이징하기
# 312 - 313

def get_total_page(m, n):
    if m % n == 0:
        return m // n 
    else:
        return m // n + 1
    
print(get_total_page(5, 10))
print(get_total_page(15, 10))
print(get_total_page(25, 10))
print(get_total_page(30, 10))