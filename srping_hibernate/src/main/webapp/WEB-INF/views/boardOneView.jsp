<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
<!-- CSS Resource에서 불러와 사용하는 부분 -->
<c:url value="/resources/css/tablestyle.css" var="maincss" />
<link href="${maincss}" rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>


<script>
<!--form의 submit 버튼을 다중 action 대상을 제어하는 함수-->
function mySubmit(index){
	
	var numVal = document.getElementById("numVal").innerHTML;	//innerHTML을 통해 폼에서 num(글번호)를 받아온다	
	var nowPage = ${nowPage};
	var goAction = "";	//폼이 보내질 곳!
		
	if(index==1){
		goAction = "boardList.do?nowPage=" + nowPage;
		textform.action= goAction;
	}
	
	if(index==2){
		goAction = "boardUpdate.do?num=" + numVal + "&nowPage=" + nowPage;		//수정
		textform.action= goAction;
	}
	
	if(index==3){textform.action='boardReinsert.do';}
	
	if(index==4){
		goAction = "boardDelete.do?num=" + numVal + "&nowPage=" + nowPage;	//삭제
		textform.action=goAction;
	}
	
};

</script> 


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
<h1>게시글조회</h1>
	<form name="textform" method="post">
		<table width="900" class="table table-bordered">
		<c:forEach var="item" items="${list}">
		<tr>
			<td width="20%" align="left" class="active"><b>번호</b></td>
			<td id="numVal" width="80%" align="left">${item.num}</td>
			<c:set var="bno" value="${item.num}"/>	<!-- c:set 으로 값저장 -->
		</tr>
		<tr>
			<td  align="left" class="active"><b>조회</b></td>
			<td  align="left">${item.readCount}</td>
		</tr>
		<tr>
			<td  align="left" class="active"><b>제목</b></td>
			<td  align="left">${item.title}</td>
		</tr>
		</tr>
			<td  align="left" class="active"><b>작성일</b></td>
			<td  align="left">${item.writeDate}</td>
		</tr>
		<tr height="320dp">
			<td  align="left" class="active"><b>내용</b></td>
			<td  align="left">${item.content}</td>
		</c:forEach>
		</table>

		<div class="huge-top text-right">
					<input type="submit" value="목록"  onClick="mySubmit(1)" class="btn btn-outline-secondary">		
					<input type="submit" value="수정"  onClick="mySubmit(2)" class="btn btn-outline-secondary">
					<input type="submit" value="삭제"  onClick="mySubmit(4)" class="btn btn-outline-secondary">
		</div>
	</form>	
</div>	

<br><br>

	<!-- 댓글 입력폼 -->
	<div class="container">
       <form name="commentInsertForm" onsubmit="return enterKey()">
            <div class="input-group">
               <input type="hidden" name="bno" value="${bno}"/>
               <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
               </span>
              </div>
        </form>
	</div>        

<br>
    <!-- 댓글 출력부 -->
    <div class="container">
        <div class="commentList"></div>
    </div>
        

        
<script>        
var numVal = document.getElementById("numVal").innerHTML;	//글번호

//위에 댓글 입력폼 제어
function enterKey(){
	var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
    return false;
}

//1. 댓글등록 버튼 클릭스 이벤트 
$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
	var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});

//2. 댓글목록을 보여주는 리스트
function commentList(){
	$.ajax({
        type: "get",
        //contentType: "application/json", ==> 생략가능(RestController이기때문에 가능)
        url: "comment/list?bno="+numVal,
        success: function(result){
        	var output = ''; 
            for(var i in result){
                output += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                output += '<div class="commentInfo'+result[i].cno+'">'+'[No.' + result[i].cno +']';
                output += ' ' + result[i].regdate;
                output += '&nbsp&nbsp<button class="btn btn-outline-secondary btn-xs" onclick="commentUpdate('+result[i].cno+',\''+result[i].content+'\');" style="cursor:pointer;"> 수정 </button>';
                output += '&nbsp<button class="btn btn-outline-secondary btn-xs" onclick="commentDelete('+result[i].cno+');" style="cursor:pointer;"> 삭제 </button> </div>';
                output += '<div class="commentContent'+result[i].cno+'"> <p>'+result[i].content +'</p>';
                output += '</div></div>';
            }
            $(".commentList").html(output);
        }
    });
}

//3. 댓글입력
function commentInsert(insertData){
	$.ajax({
        url : 'comment/insert',
        type : 'get',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');		//댓글창에 입력되어있는 값 비우기 
            }
        }
    });
}

//4.댓글 삭제
function commentDelete(cno){
    $.ajax({
        url : 'comment/delete/'+cno,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(); //댓글 삭제후 목록 출력 
        }
    });
}

//5.댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(cno, content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+cno).html(a);
    
}

//5.댓글 수정
function commentUpdateProc(cno){
    var updateContent = $('[name=content_'+cno+']').val();
    
    $.ajax({
        url : 'comment/update',
        type : 'post',
        data : {'content' : updateContent, 'cno' : cno},
        success : function(data){
            if(data == 1) commentList(); //댓글 수정후 목록 출력 
        }
    });
}

// 최초 댓글목록 출력
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
</script>
        

</body>
</html>
