
document.addEventListener("DOMContentLoaded", 
    function(e){
        let button = document.querySelectorAll("input")
        button.addEventListener("input", 
            function(e){
                console.log(e.target.value)
            }
        )
    }
)

function hi(){
    alert("hi")
}