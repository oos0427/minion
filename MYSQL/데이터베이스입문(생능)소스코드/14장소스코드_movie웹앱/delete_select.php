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
  <!-- 삭제 영화정보 검색 다이알로그 --> 
  <div data-role="dialog" id="page3">
	<div data-role="header" data-theme="b">
		<h1>영화 검색</h1>
	</div>
	<div data-role="content"> 
		<h3>삭제할 영화 검색</h3>
		<form name="form3" method="post" action="delete.php" data-ajax="false">  
			<div class="ui-body ui-body-a"></br>	
				검색 영화명 :</br>
				<input type="search" name="smovieTitle3" value=""/></br>  
			</div></br>		
	        <input data-inline="true" type="submit" value="검색"/>
	        <a data-inline="true" data-role="button" data-rel="back">취소</a>         
 		</form>					
	</div>
  </div>
</body>
</html>