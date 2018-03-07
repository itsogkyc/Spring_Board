<%@ page contentType="text/html; charset=euc-kr" %>
 
<script>

alert("����");

var bno = document.getElementById("numVal").innerHTML; //�Խñ� ��ȣ
 
 
$('[name=commentInsertBtn]').click(function(){ //��� ��� ��ư Ŭ���� 
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm�� ������ ������
    commentInsert(insertData); //Insert �Լ�ȣ��(�Ʒ�)
});
 
 
//��� ��� 
function commentList(){
	alert("����");
    $.ajax({
        url : 'comment/list',
        type : 'get',
        success : function(data){
            var a =''; 
            $.each(data, function(key, value){ 
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+value.cno+'">'+'��۹�ȣ : '+value.cno;
                a += '<a onclick="commentUpdate('+value.cno+',\''+value.content+'\');"> ���� </a>';
                a += '<a onclick="commentDelete('+value.cno+');"> ���� </a> </div>';
                a += '<div class="commentContent'+value.cno+'"> <p> ���� : '+value.content +'</p>';
                a += '</div></div>';
            });
            alert(a);
            $(".commentList").html(a);
        }
    });
}
 
 
success: function(result){
	var output = "<table border=1>";
    for(var i in result){
        output += "<tr>";
        output += "<td>"+result[i].cno+"</td>";
        output += "<td>"+result[i].content+"</td>";
        output += "<tr>";
    }
    output += "</table>";
    alert(output);
    $(".commentList").html(output);
}
 
 
 
//��� ���
function commentInsert(insertData){
    $.ajax({
        url : '/comment/insert',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //��� �ۼ� �� ��� ��� reload
                $('[name=content]').val('');
            }
        }
    });
}
 
//��� ���� - ��� ���� ����� input ������ ���� 
function commentUpdate(cno, content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">����</button> </span>';
    a += '</div>';
    
    $('.commentContent'+cno).html(a);
    
}
 
//��� ����
function commentUpdateProc(cno){
    var updateContent = $('[name=content_'+cno+']').val();
    
    $.ajax({
        url : '/comment/update',
        type : 'post',
        data : {'content' : updateContent, 'cno' : cno},
        success : function(data){
            if(data == 1) commentList(bno); //��� ������ ��� ��� 
        }
    });
}
 
//��� ���� 
function commentDelete(cno){
    $.ajax({
        url : '/comment/delete/'+cno,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(bno); //��� ������ ��� ��� 
        }
    });
}
 
 
$(document).ready(function(){
    commentList(); //������ �ε��� ��� ��� ��� 
});
 
 
 
</script>
