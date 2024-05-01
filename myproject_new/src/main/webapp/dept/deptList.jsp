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
<title>사원목록</title>
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

<body>
	<table>
		<caption>부서목록</caption>
		<tr>
			<th>부서번호</th>
			<th>부서이름</th>
			<th>부서위치</th>
		</tr>
		
		<!-- 
			jsp데이터를 받을려면 jspl로 받아야 되는데 그 학장 문법이 ${}
			컨트롤러의 model.addAttribue("resultList")와 items 이름이 같아야한다.
			var = "내부변수" items = "데이터값"
		-->
		<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
				<td>${ result.deptno }</td>
				<td>${ result.dname }</td>
				<td>${ result.loc }</td>
			</tr>
		</c:forEach>
		
	</table>
</body>
</html>