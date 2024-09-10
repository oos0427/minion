// document 객체를 대상으로 이벤트 리스너를 추가합니다.
// 이벤트 종류는 "DOMContentLoaded"입니다.
document.addEventListener("DOMContentLoaded", 
    // 이벤트 핸들러입니다. 
    // HTML 코드가 로딩된 다음 비동기적으로 수행할 작업들입니다.
    function(e){
        // input 태그를 찾아 button 변수에 저장합니다.
        let button = document.querySelector("input")
        // button 변수에 이벤트 리스너를 추가합니다.
        // 이벤트 종류는 "input"입니다.
        button.addEventListener("input", 
            function(e){
                // 콘솔에 입력창의 값을 출력합니다.
                console.log(e.target.value)
            }
        )
    }
)

// <p>태그에서 인라인 이벤트 모델로 호출할 함수를 정의합니다.
// 함수의 이름은 hi입니다.
function hi(){
    // alert()를 띄워 "hi"라는 글자를 출력합니다.
    alert("hi")
}