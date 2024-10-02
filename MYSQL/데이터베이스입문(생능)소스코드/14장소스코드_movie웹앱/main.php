<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<meta name="viewport" content="initial-scale=1.0, width=device-width">
	<title>영화 관리</title>
    <!-- 제이쿼리 모바일, 제이쿼리 라이브러리 화일 -->
	<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css"/>
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>  
<body>
<!-- 시작 메뉴 화면 -->
  <div data-role="page" id="page0">
	<div data-role="header" data-position="fixed" data-theme="b">
		<h1>영화 정보 관리</h1>
		<a href="#page0" data-icon="home" data-iconpos="notext" class="ui-btn-right">Home</a>
	</div>
	<div data-role="content">
		<img style="margin: 20px auto; display: block;" src="cinema.png">
		<ul data-role="listview" data-inset="true">
			<li><a href="insert.php">영화 정보 추가</a></li>
			<li><a href="update_select.php">영화 정보 갱신</a></li>
			<li><a href="delete_select.php">영화 정보 삭제</a></li>
			<li><a href="selectAll.php">전체 영화 조회</a></li>
		</ul>
	</div>
	<div data-role="footer" data-position="fixed" data-theme="b">
		<h4>movie & movie cinema</h4>
    </div>
  </div>
</html>  