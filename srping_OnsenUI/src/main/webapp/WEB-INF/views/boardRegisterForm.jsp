<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta name="viewport" content="width=device-width"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>	<!-- 나 jquery -->
<c:url value="/resources/css/tablestyle.css" var="maincss" />
<link href="${maincss}" rel="stylesheet" />

	<!-- onsen ui import -->
  	<link rel="stylesheet" href="https://unpkg.com/onsenui/css/onsenui.css">
  	<link rel="stylesheet" href="https://unpkg.com/onsenui/css/onsen-css-components.min.css">
  	<script src="https://unpkg.com/onsenui/js/onsenui.min.js"></script>




<script>
	function checkNumber() {
		var objEv = event.srcElement;
		var num = "\\";
		event.returnValue = true;

		for (var i = 0; i < objEv.value.length; i++) {
			if (-1 != num.indexOf(objEv.value.charAt(i))) {
				event.returnValue = false;
			}
		}

		if (!event.returnValue) {
			alert("입력할 수 없는 글자입니다.");
			objEv.value = "";
		}
	}
	
	
	//내가 JQURY 입니다!!!
	$(document).ready(
		function(){
			
			var formObj = $("form[role='form']");
			
			
			$('#btn').on("click", function(){
				formObj.submit();
			});		
	});
	
	
</script>

<title>글쓰기</title>

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
	<c:url var="insertUrl" value="/boardInsert.do" />
	<form:form commandName="boardVO" action="${insertUrl}" name="boardVO" role="form"
		method="post" >
		<table width="900" class="table table-bordered">
			<tr>
				<td width="20%" class="active" >제목</th>
				<td width="80%"><input path="title" type="text" id="title" class="form-control col-sm-5"
					name="title" maxlength="65" size="70" onkeyup="checkNumber(this)"></td>
			</tr>
			<tr>
				<td class="active">내용</th>
				<td><form:textarea class="form-control col-sm-5" path="content" id="content" rows="20"
						style="width:100%" onkeyup="checkNumber(this)" /></td>
			</tr>
		</table>
		<div class="huge-top text-right">
				<input id="submitbtn" type="submit" value="등록"  class="btn btn-outline-secondary" /> 
				<input type="button"  class="btn btn-outline-secondary" value="취소" onClick="location.href='boardList.do'"	/>
		</div>
	</form:form>
	
</div>

<br>

</ons-page>

</body>
</html>
