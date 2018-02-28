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


	<!-- 게시글 리스트 보여주기 -->
	<div class="container">
		<table class="table table-board table-hover">
			<colgroup>
				<col width="7%">
				<!-- 글 번호 -->
				<col width="*">
				<!--  제목   -->
				<!--<col width="15%">-->
				<!-- 작성자 -->
				<col width="15%">
				<!-- 작성일 -->
				<col width="7%">
				<!-- 조회수 -->
			</colgroup>
			<thead>
				<tr>
					<td align="center"><b>번호</b></td>
					<td align="center"><b>제목</b></td>
					<td align="center"><b>작성일</b></td>
					<td align="center"><b>조회수</b></td>
				</tr>
			</thead>
			<tbody>
				<!-- "c:" jstl의 반복문/조건/제어를 담당하는 라이브러리의 접두어로서 상단에 임포트를 해야 사용가능하다 -->
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
				onClick="location.href='<c:url value='/boardRegisterForm.do' />'" >쓰기</button>
		</div>
	
		<div class=	"text-center">
			<ul class="pagination">
				<li><a href="<c:url value='/boardList.do?nowPage=${pageMaker.firstPage}'/>">처음</a></li>
				<li><a href="<c:url value='/boardList.do?nowPage=${pageMaker.prevPage}'/>">이전</a></li>
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
				<li><a href="<c:url value='/boardList.do?nowPage=${pageMaker.nextPage}'/>">다음</a></li>
				<li><a href="<c:url value='/boardList.do?nowPage=${pageMaker.lastPage}'/>">마지막</a></li>
			</ul>
		</div>

	</div>
</body>
</html>
