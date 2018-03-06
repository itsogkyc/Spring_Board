<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width"/>
<!-- CSS Resource에서 불러와 사용하는 부분 -->
<c:url value="/resources/css/tablestyle.css" var="maincss" />
<link href="${maincss}" rel="stylesheet" />
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>	<!-- 나 jquery -->
	<!-- onsen ui import -->
  	<link rel="stylesheet" href="https://unpkg.com/onsenui/css/onsenui.css">
  	<link rel="stylesheet" href="https://unpkg.com/onsenui/css/onsen-css-components.min.css">
  	<script src="https://unpkg.com/onsenui/js/onsenui.min.js"></script>




<script>

<!-- 역슬래시 못 넣게 금지해주는 함수~!-->
function checkNumber() {
	var objEv = event.srcElement;
	var num ="\\";
	event.returnValue = true;
   
	for (var i = 0; i < objEv.value.length; i++) {
		if (-1 != num.indexOf(objEv.value.charAt(i))) {
		event.returnValue = false;
		}	
	}
   
	if (!event.returnValue) {
		alert("일부 문자는 입력 불가합니다.");
		objEv.value="";
	}
};



//내가 JQURY 입니다!!!
$(document).ready(
	function(){
		
		var formObj = $("form[role='form']");
		
		
		$('#btn').on("click", function(){
			formObj.submit();
		});		
});


</script>


<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
<title>Home</title>
</head>
<body>

	<ons-page>
		<!-- 헤더툴바 -->
		<ons-toolbar>
	    	<div class="left">
		      <ons-back-button onclick="history.back()">Back</ons-back-button>
	    	</div>
			<div class="center">게시판</div>
			</div>
			<div class="right">
			<ons-toolbar-button id="btn"><ons-icon icon="ion-ios-paperplane-outline"></ons-icon></ons-toolbar-button>
			</div>
		</ons-toolbar>

<br>

<div class="container">
	<form name="boardVO" method="post" action="doUpdate.do?nowPage=${nowPage}&updated=${item.num}" role="form">
		<table width="900" class="table table-bordered">
		<c:forEach var="item" items="${list}">
			<tr>
				<td width="20%" align="left" class="active"><b>번호</b></td>
				<td width="80%" align="left"><input  style="border:none" type="text" width="80%" id="num" name="num" align="left" value="${item.num}" readonly/></td>
			</tr>
			<tr>
				<td width="20%" align="left" class="active"><b>조회</b></td>
				<td width="80%" align="left">${item.readCount}</td>
			</tr>
			<tr>
				<td width="20%" align="left" class="active"><b>제목</b></td>
				<td width="80%" align="left">
					<input type="text" id="title" name="title" maxlength="65" size="70" value="${item.title}" onkeyup="checkNumber(this)" class="form-control col-sm-5">
				</td>
			</tr>
		</tr>
			<td width="20%" align="left" class="active"><b>작성일</b></td>
			<td width="80%" align="left">${item.writeDate}</td>
		</tr>
			<tr>
				<td width="20%" align="left" class="active"><b>내용</b></td>
				<td width="80%" align="left">
					<textarea name="content" id="content" rows="20" style="width:100%" onkeyup="checkNumber(this)" class="form-control col-sm-5">${item.content}</textarea>
				</td>
			</tr>
		</c:forEach>
		</table>
		<div class="huge-top text-right">
				<input type="submit" value="수정" class="btn btn-outline-secondary">		
				<input type="button" value="취소" class="btn btn-outline-secondary" onClick="location.href='boardList.do?nowPage=${nowPage}'">
		</div>
	</form>	

</div>
<br>
</ons-page>	
</body>
</html>
