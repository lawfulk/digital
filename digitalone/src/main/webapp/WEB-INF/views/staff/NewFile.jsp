<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="all" action="a.do" method="post">
  <table>
  <tr>
	<th colspan="6">사원 정보 검색</th>
  </tr>
  <tr>
	<th>이름</th>
	<td><input type="text" name="staff_name"></td>
	<th>성별</th>
	<td><input type="checkbox" name="sex" value="남">남
		<input type="checkbox" name="sex" value="여">여
	</td>
	<th>종교</th>
	<td><select name="religion_code" style="width: 100px;">
		<option></option>
		<option value="1">기독교</option>
		<option value="2">천주교</option>
		<option value="3">불교</option>
		<option value="4">이슬람</option>
		<option value="5">무교</option>
	</select></td>
  </tr>
  <tr>
	<th>학력</th>
	<td style="padding-right: 15px;">
		<input type="checkbox" name="school" value="1">고졸
		<input type="checkbox" name="school" value="2">전문대졸
		<input type="checkbox" name="school" value="3">일반대졸
		
	</td>
	<th>기술</th>
	<td colspan="3" style="padding-right: 100px;">
		<input type="checkbox" name="skill" value="1">JAVA
		<input type="checkbox" name="skill" value="2">JSP
		<input type="checkbox" name="skill" value="3">ASP
		<input type="checkbox" name="skill" value="4">PHP
		<input type="checkbox" name="skill" value="5">Delphi
	</td>
  </tr>
  <tr>
	<th>졸업일</th>
	<td colspan="6">년월일 체크박스 ~ 년월일 체크박스 </td>
  </tr>
  <tr>
	<td class="re1" colspan="4" align="center">
	<input type="submit" value="검색" style="width: 200px;">
	</td>
	<td class="re2" colspan="2">
	<input type="submit" value="전부검색">
	<input type="reset" value="초기화">
	<input type="button"  value="등록">
	</td>
  </tr>
  </table>
 </form> 
<table>
	<thead>
		<tr>
			<td class="re3" colspan="6">검색건수-->건</td>
		</tr>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>성별</th>
			<th>종교</th>
			<th>졸업일</th>
			<th>수정/삭제</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty list}">
			<tr>
				<td colspan="6" align="center">
					검색 조건을 이용하세요
				</td>
			</tr>
		</c:if>
		
		<c:forEach var="dto" items="${list}">
		<tr>
			<td>${dto.staff_no}</td>
			<td>${dto.staff_name}</td>
			<td>${dto.jumin_no}</td>
			<td>${dto.religion_name}</td>
			<td>${dto.graduate_day}</td>
			<td><input type="button" name="redel" value="수정/삭제"></td>
		</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="6" align="center">
				페이징 자리
			</td>
		</tr>
	</tfoot>
</table>

</body>
</html>