<?php

//movieDB 데이터베이스 연결
$conn=mysqli_connect("localhost", "movie_user", "1234", "movieDB") or die("movieDB 접속 실패 !!");

$title = $_POST["title1"];
$genre = $_POST["movieGenre1"];
$myear = $_POST["movieYear1"];
$price = $_POST["moviePrice1"];
$file = $_FILES['upfile'];

$upload_dir = "./photo/";
$pathfile = $upload_dir.basename($file['name']);

if(isset($_FILES['upfile']) && $_FILES['upfile']['name'] != "") {       
    if(move_uploaded_file($file['tmp_name'], $pathfile)) {        
        $sql="INSERT INTO MOVIE(id, title, genre, myear, price, photo) VALUES(NULL,'".$title."','".$genre."','".$myear."',".$price.",'".$pathfile."');";     
        $result=mysqli_query($conn, $sql);
        
        if($result) {
            echo "<script>alert('".$title." 정보 추가 되었습니다');</script>"; 
        }
        else {
            $err_msg=mysqli_error($conn);
            echo "<script>alert(\"SQL문 정보추가 오류 \\n오류내용: $err_msg\");</script>" ;
        }                      
     }   
}  else {       
        echo "<script>alert('화일이 업로드 되지 않았습니다.');</script>";
}

mysqli_close($conn);

echo '<script>location.replace("main.php");</script>'; 

?>