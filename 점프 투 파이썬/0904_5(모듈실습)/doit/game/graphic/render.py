# from game.sound.echo import echo_test ..은 부모디렉터리를 뜻해서 아래와 같이 수정 가능
from ..sound.echo import echo_test

def render_test():
    print("render")
    echo_test()