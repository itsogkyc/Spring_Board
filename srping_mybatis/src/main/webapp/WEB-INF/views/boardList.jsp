<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<title>Home</title>


<c:url value="/resources/css/tablestyle.css" var="maincss" />
<link href="${maincss}" rel="stylesheet" type="text/css" />

</head>

<body link=black vlink=black>

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


	<!-- �Խñ� ����Ʈ �����ֱ� -->
	<div class="container">
		<table class="table table-board table-hover">
			<colgroup>
				<col width="7%">
				<!-- �� ��ȣ -->
				<col width="*">
				<!--  ����   -->
				<!--<col width="15%">-->
				<!-- �ۼ��� -->
				<col width="15%">
				<!-- �ۼ��� -->
				<col width="7%">
				<!-- ��ȸ�� -->
			</colgroup>
			<thead>
				<tr>
					<td align="center"><b>��ȣ</b></td>
					<td align="center"><b>����</b></td>
					<td align="center"><b>�ۼ���</b></td>
					<td align="center"><b>��ȸ��</b></td>
				</tr>
			</thead>
			<tbody>
				<!-- "c:" jstl�� �ݺ���/����/��� ����ϴ� ���̺귯���� ���ξ�μ� ��ܿ� ����Ʈ�� �ؾ� ��밡���ϴ� -->
				<c:forEach var="item" items="${list}">
					<tr>
						<td align="center">${item.num}</td>
						<c:choose>
							<c:when test="${item.reply > 0}">
								<td align="left"><a	href="<c:url value='/boardOneView.do?nowPage=${pageMaker.nowPage}&num=${item.num}'/>">${item.title} </a><font color="red">(${item.reply})</font></td>
							</c:when>
							<c:otherwise>
								<td align="left"><a	href="<c:url value='/boardOneView.do?nowPage=${pageMaker.nowPage}&num=${item.num}'/>">${item.title}</a></td>
							</c:otherwise>
						</c:choose>
						<td align="center">${item.writeDate}</td>
						<td align="center">${item.readCount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="huge-top">
			<button class="btn btn-outline-secondary pull-right" type="button"
				onClick="location.href='<c:url value='/boardRegisterForm.do' />'" >����</button>
		</div>
	
		<div class=	"text-center">
			<ul class="pagination">
				<li><a href="<c:url value='/boardList.do?nowPage=${pageMaker.firstPage}'/>">ó��</a></li>
				<li><a href="<c:url value='/boardList.do?nowPage=${pageMaker.prevPage}'/>">����</a></li>
				<c:forEach var="pageNum" begin="${pageMaker.startPage}"	end="${pageMaker.endPage}">
					<c:choose>
						<c:when test="${pageNum == pageMaker.nowPage}">
							<li><a href="#" style="color: red" disabled="disabled"><b>${pageNum}</b></a></li>
						</c:when>
						<c:otherwise>
							<li><a href="<c:url value='/boardList.do?nowPage=${pageNum}'/>">${pageNum}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<li><a href="<c:url value='/boardList.do?nowPage=${pageMaker.nextPage}'/>">����</a></li>
				<li><a href="<c:url value='/boardList.do?nowPage=${pageMaker.lastPage}'/>">������</a></li>
			</ul>
		</div>

	</div>
</body>
</html>
