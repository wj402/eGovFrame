<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>

<% pageContext.setAttribute("newline", "\n"); %>
<c:set var="content" value="${fn:replace(boardVO.content, newline, '<br>' ) }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세 화면</title>
<script src="/myproject_new/script/jquery-3.6.0.js"></script>
<script src="/myproject_new/script/jquery-ui.js"></script>

</head>

<style>
	body {
		font-size:9pt;
	}
	
	button {
		font-size:9pt;
	}
	
	table {
		width: 600px;
		board-collapse:collapse;
	}
	
	th, td {
		bordeR: 1px solid #ccc;
		padding:3px;
	}
	
	.input1 {
		width:98%;
	}
	.textarea {
		width:98%;
		height:70px;
	}
</style>

<script>

	$(function(){
		$("#title").val("제목입력");
	});

	function fn_submit() {
		
		// trim() -> 앞뒤 공백 제거, java, jsp
		
		if( $.trim( $("#title").val() ) == "") {
			alert("제목을 입력해주세요");
			$("#title").focus();
			return false;
		}
		$("#title").val($.trim($("#title").val()));
		
		if ( $.trim( $("#pass").val() ) == "") {
			alert("암호를 입력해주세요");
			$("#pass").focus();
			return false;
		}
		$("#pass").val($.trim($("#pass").val()));
		
		var formData = $("#frm").serialize();
		
		// ajax: 비동기 전송방식의 기능을 가지고 있는 jquery의 함수
		$.ajax({
			type: "POST",
			data: formData,
			url: "boardWriteSave.do",
			dataType: "text",
			success:function(data) {
			  //alert(data);
			  if(data == "ok") { // 저장 처리 후 리턴 값 확인
			  	alert("저장완료");
				location = "boardList.do";
			} else {
				alert("저장 실패했습니다. 다시 시도해 주세요.");
			}
		},
		error: function() {
			alert("오류발생 ");
		}
		});
		
		// document.frm.submit(); // 동기전송방식
	}
</script>

<body>

<form id="frm">
	<table>
		<caption>게시판 상세</caption>
		<tr>
			<th width="20%">제목</th>
			<td width="80%">${boardVO.title }</td>
		</tr>
		<tr>
			<th>글쓴이</th>
			<td><c:out value="${boardVO.name }" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td height="50"> <!--  aaa \n -> <br> -->
				${boardVO.content }
			</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>${boardVO.rdate }</td>
		</tr>
		<tr>
			<th colspan="2">
				<button type="submit" onclick="fn_submit();return false;">저장</button>
				<button type="reset">취소</button>
			</th>
		</tr>
	</table>
</form>
</body>
</html>