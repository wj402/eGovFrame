<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="kor" value="90" />
<c:set var="eng" value="80" />
<c:set var="hap" value="${kor+eng}" />
<c:set var="str" value="javascript" />

국어점수 : ${kor } <br>
영어점수 : ${eng } <br>
합계1 : ${kor } + ${eng } <br>
합계2 : ${kor + eng }<br>
합계3 : ${hap } <br>

문자열 길이 : ${fn:length(str) } <br>
치환 : ${fn:replace(str, "java", "oracle") } <br>
범위설정 : ${fn:substring(str,0,4) } <br>
<br>
-- 수학관련 --  <br>
<c:set var="foo" value="3.3" />
foo변수값 : <c:out value = "${foo}" /> <br>
floor적용 : ${foo - (foo%1) } <br>
ceil적용 : ${foo + ( 1 - (foo%1)) % 1} <br>
round적용 : ${foo + 0.5 - ((foo+0.5) % 1) } <br>

<c:set var="kor" value="77" />

<c:if var="result" test= "${kor >= 90 }"> <br>
	A학점 : ${result } <br>
</c:if>
<c:if var="result" test= "${kor < 90 && kor >= 80 }"> <br>
	B학점 : ${result }<br>
</c:if>

<c:if var="result" test= "${kor < 80 && kor >= 70 }"> <br>
	C학점 : ${result }<br>
</c:if>

<c:if var="result" test= "${kor < 70 && kor >= 60 }"> <br>
	D학점 <br>
</c:if>

<c:if var="result" test= "${ kor < 60 }"> <br>
	F학점 <br>
</c:if>

<c:set var="title" value="java"/>
<c:if test="${title == 'java' }">
	같음
</c:if>
<c:if test="${title != 'java' }">
	같지않음
</c:if>

<br><br>
-- 반복문 --

<c:forEach var="i" begin="1" end="10" step="3">
	${i }
</c:forEach>

<br /><br />

 -->
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<form name="frm" method="post" action="deptWriteSave.do">
	<table>
		<tr>
			<th>부서번호</th>
			<td><input type="text" name="deptno"></td>
		</tr>
		<tr>
			<th>부서이름</th>
			<td><input type="text" name="dname"></td>
		</tr>
		<tr>
			<th>부서위치</th>
			<td><input type="text" name="loc"></td>
		</tr>
		<tr>
			<th colspan="2">
				<button type="submit">저장</button>
			</th>
		</tr>
	</table>	
</form>

</body>
</html>