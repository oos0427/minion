<?php

//movieDB 데이터베이스 연결
$conn=mysqli_connect("localhost", "movie_user", "1234", "movieDB") or die("movieDB 접속 실패 !!");

$title = $_POST["movieTitle3"];

$sql="SELECT photo FROM movie WHERE title = '".$title."'" ;
$result=mysqli_query($conn, $sql);
$row = mysqli_fetch_array($result);
unlink($row["photo"]);

$sql="DELETE FROM movie WHERE title = '".$title."'" ;
$result=mysqli_query($conn, $sql);

if($result) {
    echo "<script>alert('".$title." 정보 삭제 되었습니다');</script>"; 
}
else {
    $err_msg=mysqli_error($conn);
    echo "<script>alert(\"SQL문 정보삭제 오류 \\n오류내용: $err_msg\");</script>" ;
}
mysqli_close($conn);

echo "<script>location.replace('main.php');</script>"; 

?>