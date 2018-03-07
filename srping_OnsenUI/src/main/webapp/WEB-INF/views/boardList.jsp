<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
	<meta name="viewport" content="width=device-width"/>
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<!-- onsen ui import -->
  	<link rel="stylesheet" href="https://unpkg.com/onsenui/css/onsenui.css">
  	<link rel="stylesheet" href="https://unpkg.com/onsenui/css/onsen-css-components.min.css">
  	<script src="https://unpkg.com/onsenui/js/onsenui.min.js"></script>
  	
	<script>
		var notify = function() {
		  ons.notification.alert('만든이 : 김영철 <br> 2018.03.06');
		};
	</script>  	
  	
  	
</head>

<body link=black vlink=black>

	<ons-page>
		<!-- 헤더툴바 -->
		<ons-toolbar>
	    	<div class="left">
		      <ons-toolbar-button icon="md-face" onclick="notify()"></ons-toolbar-button>
	    	</div>
			<div class="center">게시판</div>
			<div class="right">
			<ons-toolbar-button>
				<ons-toolbar-button onClick="location.href='<c:url value='/boardRegisterForm.do' />'"><ons-icon id="toolbar-icon" icon="ion-compose"></ons-icon></ons-toolbar-button>
			</ons-toolbar-button>
			</div>
		</ons-toolbar>
  	
 
  	
  	
  		<!-- alert -->
		<template id="alert-dialog.html">
		  <ons-alert-dialog id="my-alert-dialog" modifier="rowfooter">
		    <div class="alert-dialog-title">알림</div>
		    <div class="alert-dialog-content">만든이 : 김영철 <br> 2018.03.06</div>
		    <div class="alert-dialog-footer">
		      <ons-alert-dialog-button onclick="hideAlertDialog()">OK</ons-alert-dialog-button>
		    </div>
		  </ons-alert-dialog>
		</template>
  	
  	
  		<!-- 게시글 -->
	  	<ons-list>
			<c:forEach var="item" items="${list}">    
		    <ons-list-item tappable>
		      <div class="center">
				<c:choose>
					<c:when test="${item.reply > 0}">
						<span class="list-item__title" onclick="location.href='boardOneView.do?nowPage=${pageMaker.nowPage}&num=${item.num}'">[${item.num}]<a href="#">${item.title}</a><font color="red">(${item.reply})</font></span>
					</c:when>
					<c:otherwise>
						<span class="list-item__title" onclick="location.href='boardOneView.do?nowPage=${pageMaker.nowPage}&num=${item.num}'">[${item.num}]<a href="#">${item.title}</a></span>
					</c:otherwise>
				</c:choose>
				<span class="list-item__subtitle">${item.writeDate} 조회수 : ${item.readCount}</span>
		      </div>
		    </ons-list-item>
			</c:forEach>
	    </ons-list>

		<!-- 글쓰기 버튼 -->
		<ons-fab position="bottom right" onClick="location.href='<c:url value='/boardRegisterForm.do' />'" style="margin-bottom:50px">
	   		<ons-icon icon="md-plus"></ons-icon>
	  	</ons-fab>
	  	
	  	<!-- 페이지 버튼 -->
		<div class="container">
		<div class=	"text-center">
			<ul class="pagination pagenation-sm">
				<li><a href="<c:url value='/boardList.do?nowPage=${pageMaker.firstPage}'/>">&lt;&lt;</a></li>
				<li><a href="<c:url value='/boardList.do?nowPage=${pageMaker.prevPage}'/>">&lt;</a></li>
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
				<li><a href="<c:url value='/boardList.do?nowPage=${pageMaker.nextPage}'/>">&gt;</a></li>
				<li><a href="<c:url value='/boardList.do?nowPage=${pageMaker.lastPage}'/>">&gt;&gt;</a></li>
			</ul>
		</div>
		</div>
	</ons-page>
	
</body>
</html>
