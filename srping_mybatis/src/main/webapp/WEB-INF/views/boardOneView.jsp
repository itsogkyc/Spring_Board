<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
<!-- CSS Resource���� �ҷ��� ����ϴ� �κ� -->
<c:url value="/resources/css/tablestyle.css" var="maincss" />
<link href="${maincss}" rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>


<script>
<!--form�� submit ��ư�� ���� action ����� �����ϴ� �Լ�-->
function mySubmit(index){
	
	var numVal = document.getElementById("numVal").innerHTML;	//innerHTML�� ���� ������ num(�۹�ȣ)�� �޾ƿ´�	
	var nowPage = ${nowPage};
	var goAction = "";	//���� ������ ��!
		
	if(index==1){
		goAction = "boardList.do?nowPage=" + nowPage;
		textform.action= goAction;
	}
	
	if(index==2){
		goAction = "boardUpdate.do?num=" + numVal + "&nowPage=" + nowPage;		//����
		textform.action= goAction;
	}
	
	if(index==3){textform.action='boardReinsert.do';}
	
	if(index==4){
		goAction = "boardDelete.do?num=" + numVal + "&nowPage=" + nowPage;	//����
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
<h1>�Խñ���ȸ</h1>
	<form name="textform" method="post">
		<table width="900" class="table table-bordered">
		<c:forEach var="item" items="${list}">
		<tr>
			<td width="20%" align="left" class="active"><b>��ȣ</b></td>
			<td id="numVal" width="80%" align="left">${item.num}</td>
			<c:set var="bno" value="${item.num}"/>	<!-- c:set ���� ������ -->
		</tr>
		<tr>
			<td  align="left" class="active"><b>��ȸ</b></td>
			<td  align="left">${item.readCount}</td>
		</tr>
		<tr>
			<td  align="left" class="active"><b>����</b></td>
			<td  align="left">${item.title}</td>
		</tr>
		</tr>
			<td  align="left" class="active"><b>�ۼ���</b></td>
			<td  align="left">${item.writeDate}</td>
		</tr>
		<tr height="320dp">
			<td  align="left" class="active"><b>����</b></td>
			<td  align="left">${item.content}</td>
		</c:forEach>
		</table>

		<div class="huge-top text-right">
					<input type="submit" value="���"  onClick="mySubmit(1)" class="btn btn-outline-secondary">		
					<input type="submit" value="����"  onClick="mySubmit(2)" class="btn btn-outline-secondary">
					<input type="submit" value="����"  onClick="mySubmit(4)" class="btn btn-outline-secondary">
		</div>
	</form>	
</div>	

<br><br>

	<!-- ��� �Է��� -->
	<div class="container">
       <form name="commentInsertForm" onsubmit="return enterKey()">
            <div class="input-group">
               <input type="hidden" name="bno" value="${bno}"/>
               <input type="text" class="form-control" id="content" name="content" placeholder="������ �Է��ϼ���.">
               <span class="input-group-btn">
                    <button class="btn btn-default" type="button" name="commentInsertBtn">���</button>
               </span>
              </div>
        </form>
	</div>        

<br>
    <!-- ��� ��º� -->
    <div class="container">
        <div class="commentList"></div>
    </div>
        

        
<script>        
var numVal = document.getElementById("numVal").innerHTML;	//�۹�ȣ

//���� ��� �Է��� ����
function enterKey(){
	var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm�� ������ ������
    commentInsert(insertData); //Insert �Լ�ȣ��(�Ʒ�)
    return false;
}

//1. ��۵�� ��ư Ŭ���� �̺�Ʈ 
$('[name=commentInsertBtn]').click(function(){ //��� ��� ��ư Ŭ���� 
	var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm�� ������ ������
    commentInsert(insertData); //Insert �Լ�ȣ��(�Ʒ�)
});

//2. ��۸���� �����ִ� ����Ʈ
function commentList(){
	$.ajax({
        type: "get",
        //contentType: "application/json", ==> ��������(RestController�̱⶧���� ����)
        url: "comment/list?bno="+numVal,
        success: function(result){
        	var output = ''; 
            for(var i in result){
                output += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                output += '<div class="commentInfo'+result[i].cno+'">'+'[No.' + result[i].cno +']';
                output += ' ' + result[i].regdate;
                output += '&nbsp&nbsp<button class="btn btn-outline-secondary btn-xs" onclick="commentUpdate('+result[i].cno+',\''+result[i].content+'\');" style="cursor:pointer;"> ���� </button>';
                output += '&nbsp<button class="btn btn-outline-secondary btn-xs" onclick="commentDelete('+result[i].cno+');" style="cursor:pointer;"> ���� </button> </div>';
                output += '<div class="commentContent'+result[i].cno+'"> <p>'+result[i].content +'</p>';
                output += '</div></div>';
            }
            $(".commentList").html(output);
        }
    });
}

//3. ����Է�
function commentInsert(insertData){
	$.ajax({
        url : 'comment/insert',
        type : 'get',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //��� �ۼ� �� ��� ��� reload
                $('[name=content]').val('');		//���â�� �ԷµǾ��ִ� �� ���� 
            }
        }
    });
}

//4.��� ����
function commentDelete(cno){
    $.ajax({
        url : 'comment/delete/'+cno,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(); //��� ������ ��� ��� 
        }
    });
}

//5.��� ���� - ��� ���� ����� input ������ ���� 
function commentUpdate(cno, content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">����</button> </span>';
    a += '</div>';
    
    $('.commentContent'+cno).html(a);
    
}

//5.��� ����
function commentUpdateProc(cno){
    var updateContent = $('[name=content_'+cno+']').val();
    
    $.ajax({
        url : 'comment/update',
        type : 'post',
        data : {'content' : updateContent, 'cno' : cno},
        success : function(data){
            if(data == 1) commentList(); //��� ������ ��� ��� 
        }
    });
}

// ���� ��۸�� ���
$(document).ready(function(){
    commentList(); //������ �ε��� ��� ��� ��� 
});
</script>
        

</body>
</html>
