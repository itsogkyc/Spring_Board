<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>

<!-- CSS Resource���� �ҷ��� ����ϴ� �κ� -->
<c:url value="/resources/css/tablestyle.css" var="maincss" />
<link href="${maincss}" rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script>

<!-- �������� �� �ְ� �������ִ� �Լ�~!-->
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
		alert("�Ϻ� ���ڴ� �Է� �Ұ��մϴ�.");
		objEv.value="";
	}
};


</script>


<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
<title>Home</title>
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
			<!-- �α��� ��� ���� �ʿ�� �߰� 
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
						<input type="submit" class="btn btn-default" value="�α���">
						</button>
					</form>
				</div>
			</center>
			 -->
		</div>
	</div>


<div class="container">

	<h1>�Խñ� ����</h1>
	<form name="boardVO" method="post" action="doUpdate.do?nowPage=${nowPage}&updated=${item.num}">
		<table width="900" class="table table-bordered">
		<c:forEach var="item" items="${list}">
			<tr>
				<td width="20%" align="left" class="active"><b>��ȣ</b></td>
				<td width="80%" align="left"><input  style="border:none" type="text" width="80%" id="num" name="num" align="left" value="${item.num}" readonly/></td>
			</tr>
			<tr>
				<td width="20%" align="left" class="active"><b>��ȸ</b></td>
				<td width="80%" align="left">${item.readCount}</td>
			</tr>
			<tr>
				<td width="20%" align="left" class="active"><b>����</b></td>
				<td width="80%" align="left">
					<input type="text" id="title" name="title" maxlength="65" size="70" value="${item.title}" onkeyup="checkNumber(this)" class="form-control col-sm-5">
				</td>
			</tr>
		</tr>
			<td width="20%" align="left" class="active"><b>�ۼ���</b></td>
			<td width="80%" align="left">${item.writeDate}</td>
		</tr>
			<tr>
				<td width="20%" align="left" class="active"><b>����</b></td>
				<td width="80%" align="left">
					<textarea name="content" id="content" rows="20" style="width:100%" onkeyup="checkNumber(this)" class="form-control col-sm-5">${item.content}</textarea>
				</td>
			</tr>
		</c:forEach>
		</table>
		<div class="huge-top text-right">
				<input type="submit" value="����" class="btn btn-outline-secondary">		
				<input type="button" value="���" class="btn btn-outline-secondary" onClick="location.href='boardList.do?nowPage=${nowPage}'">
		</div>
	</form>	

</div>	
</body>
</html>
