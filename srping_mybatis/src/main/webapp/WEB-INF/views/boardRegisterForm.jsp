<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<c:url value="/resources/css/tablestyle.css" var="maincss" />
<link href="${maincss}" rel="stylesheet" />

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
</script>

<title>글쓰기</title>

</head>
<body>

	<div class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<button class="navbar-toggle" type="button" data-toggle="collapse"
					data-target="#navbar-main">
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="boardList.do">KYC's Spring Borad</a>
			</div>
			<!-- 로그인 기능 구현 필요시 추가 
			<center>
				<div class="navbar-collapse collapse" id="navbar-main">
					<form class="navbar-form navbar-right" role="search" action="">
						<div class="form-group">
							<input type="text" class="form-control" name="id"
								placeholder="Username">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" name="password"
								placeholder="Password">
						</div>
						<input type="submit" class="btn btn-default" value="로그인">
						</button>
					</form>
				</div>
			</center>
			 -->
		</div>
	</div>

<div class="container">
	<h1>글쓰기</h1>
	<c:url var="insertUrl" value="/boardInsert.do" />
	<form:form commandName="boardVO" action="${insertUrl}" name="boardVO"
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
				<input type="submit" value="등록"  class="btn btn-outline-secondary" /> 
				<input type="button"  class="btn btn-outline-secondary" value="취소" onClick="location.href='boardList.do'"	/>
		</div>
	</form:form>
	
</div>
</body>
</html>
