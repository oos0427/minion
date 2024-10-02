<?php

//movieDB 데이터베이스 연결
$conn=mysqli_connect("localhost", "movie_user", "1234", "movieDB") or die("movieDB 접속 실패 !!");

if(isset($_POST['movieTitle2']) && isset($_POST['movieGenre2']) && isset($_POST['movieYear2']) && isset($_POST['moviePrice2'])){
    $title = $_POST["movieTitle2"];
    $genre = $_POST["movieGenre2"];
    $myear = $_POST["movieYear2"];
    $price = $_POST["moviePrice2"];
}
$sql="UPDATE movie SET title = '".$title."', genre = '".$genre."', myear = '".$myear."', price = ".$price." WHERE title = '".$title."'";
$result=mysqli_query($conn, $sql);

if($result) {
    echo "<script>alert('".$title." 정보 수정 되었습니다');</script>"; 
}
else {
    $err_msg=mysqli_error($conn);
    echo "<script>alert(\"SQL문 정보수정 오류 \\n오류내용: $err_msg\");</script>" ;
}
mysqli_close($conn);

echo "<script>location.replace('main.php');</script>";

?>