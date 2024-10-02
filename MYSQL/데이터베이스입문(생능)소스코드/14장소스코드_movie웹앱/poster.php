<?php
if(isset($_GET['title']) && $_GET['title'] !== ''){
  $title = $_GET['title'];
  echo $title;
} else {
  echo "failed";
}
?>	

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<meta name="viewport" content="initial-scale=1.0, width=device-width">
	<title>영화 관리</title>
    <!-- 제이쿼리 모바일, 제이쿼리 라이브러리 파일 -->
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css"/>
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>  
<body>

  <!-- 삭제 영화정보 검색 다이알로그 --> 
  <div data-role="dialog" id="page5">
	<div data-role="header" data-theme="b">
		<h1>영화 포스터</h1>
	</div>
	<div data-role="content" data-theme="b">  
			<div class="ui-bar ui-bar-a"><?php $title ?></div></br>
			<div><img src="<?php echo $_GET['photo']; ?>" /></div>        				
	</div>

	<?php echo  $_GET['title']; ?>
  </div>
</body>
</html>