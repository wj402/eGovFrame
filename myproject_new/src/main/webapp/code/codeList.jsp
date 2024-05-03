<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드목록</title>
</head>

<style>
	table {
		width: 400px;
		border-collapse: collapse; /* cell 간격 없앰 */
	}
	
	th,td {
		bordeR: 1px solid #ccc;
		padding: 5px;
	}
</style>

<script language="javascript">
	function fn_delete(code) {
		if( confirm("정말 삭제하시겠습니까?") ) {
			location = "codeDelete.do?code="+code;
		}
	}
</script>

<body>
<table>
	<caption>
		<div>코드목록</div> <br>
		<div style="width:100%; text-align:left;">Total : ${resultTotal } 개</div>
	</caption>
	<colgroup>
		<col width="14%" />	
		<col width="22%" />
		<col width="30%" />
		<col width="34%" />
	</colgroup>
	<tr>
		<th>번호</th>
		<th>그룹명</th>
		<th>코드명</th>
		<th>구분</th>
	</tr>
	<c:set var="count" value="1" />
	<c:forEach var="list" items="${resultList}" >
	
		<tr align="center">
			<td><c:out value="${count }" /></td>
			<td>${list.gid }</td>
			<td>${list.name }</td>
			<td>
				<button type="button">수정</button>
				<button type="button" onclick="fn_delete('${list.code}')">삭제</button>
			</td>
		</tr>
		<c:set var="count" value="${count+1}" />
	</c:forEach>
	
</table>

</body>
</html>