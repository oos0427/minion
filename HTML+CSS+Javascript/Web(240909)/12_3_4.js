let button = document.querySelector("input")
button.addEventListener("input", 
    function(e){
        console.log(e.target.value)
    }
)


// <p> 태그에서 인라인 이벤트 모델로 호출할 함수를 정의합니다.
// 함수의 이름은 hi입니다.
function hi(){
    // alert()를 띄워 "hi"라는 글자를 출력합니다.
    alert("hi")
}