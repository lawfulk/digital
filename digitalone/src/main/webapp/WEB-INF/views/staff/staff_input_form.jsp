<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
   width: 860px;
   margin: 0px auto;
   border-top: 1px solid #BDBDBD;
   border-right: 1px solid #BDBDBD;
   border-left: 1px solid #BDBDBD;
   border-spacing: 0px;
}

table th {
   width: 270px;
   border-bottom: 1px solid #BDBDBD;
   border-right: 1px solid #BDBDBD;
   background-color: #EAEAEA;
}

table td {
   width: 570px;
   text-align: center;
   border-bottom: 1px solid #BDBDBD;
   padding-left: 10px;
}

p {
   text-align: center;
}

a {
   text-decoration: none; //href 링크 밑줄 없애기
}
.input_button{
	text-align: center;
}
.reset_button{
	text-align: right;
}
.graduate_year1{
	text-align: left;
}
</style>
</head>
<script>
// 숫자만 입력 예외 경고창
function onlyNumber(event) {
    var key = window.event ? event.keyCode : event.which;    

    if ((event.shiftKey == false) && ((key  > 47 && key  < 58) || (key  > 95 && key  < 106)
    || key  == 35 || key  == 36 || key  == 37 || key  == 39  // 방향키 좌우,home,end  
    || key  == 8  || key  == 46 ) // del, back space
    ) {
        return true;
    }else {
    	window.alert("숫자만 입력하세요");
        return false;
    }    
};
function onlyNumber2(event) {
    var key = window.event ? event.keyCode : event.which;    

    if ((event.shiftKey == false) && ((key  > 47 && key  < 58) || (key  > 95 && key  < 106)
    || key  == 35 || key  == 36 || key  == 37 || key  == 39  // 방향키 좌우,home,end  
    || key  == 8  || key  == 46 ) // del, back space
    ) {
        return true;
    }else {
    	window.alert("숫자만 입력하세요");
        return false;
    }    
};


function yearChk(){
	   // var는 String int와 같은 자료형
	   // ex) var a = 0;;

	   var a = document.getElementById("year").value; /*"year1"만하면 오브젝트(아이디값)만 가져가고 .value 를 붙여야 해당 벨류값을 가져올 수 있다. */
	   
	   if (a==00) { // a(year1)값이 option value=00 과 같으면 month1,day1의 id 값이 0으로 초기화 된다.
	      document.getElementById("month").selectedIndex=0;
	      document.getElementById("day").selectedIndex=0;
	   } else{
	      document.getElementById("month").selectedIndex=1;
	      document.getElementById("day").selectedIndex=1;
	   }

	}
function staffAddAlert(){

	if (!confirm("정말 저장 하시겠습니까??")){ //취소
		
		return false;

	}else{   //확인
		document.form.submit();
	}
}
</script>
<body>
<form name="staff_input" action="staff_input_form.do" method="post" onsubmit="return staffAddAlert()">
  <table>
  <tr>
	<th colspan="6">사원 정보 등록</th>
  </tr>
  <tr>
	<th>이름</th>
	<td><input type="text" name="staff_name" required></td>
	<th>주민번호</th>
	<td><input type="text" name="jumin_no1" style="width: 70px;" maxlength="6" onkeydown="return onlyNumber(event)" required> -
		<input type="password" name="jumin_no2"  style="width: 70px;" maxlength="7" onkeydown="return onlyNumber2(event)" required>
	</td>
	<th>종교</th>
	<td><select name="religion_code" style="width: 100px;" required>
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
		<input type="checkbox" name="school_code" value="1">고졸
		<input type="checkbox" name="school_code" value="2">전문대졸
		<input type="checkbox" name="school_code" value="3">일반대졸
		
	</td>
	<th>기술</th>
	<td colspan="3" style="padding-right: 100px;">
		<input type="checkbox" name="skill_code_buffer" value="1">JAVA <!-- skill_code_buffer -->
		<input type="checkbox" name="skill_code_buffer" value="2">JSP
		<input type="checkbox" name="skill_code_buffer" value="3">ASP
		<input type="checkbox" name="skill_code_buffer" value="4">PHP
		<input type="checkbox" name="skill_code_buffer" value="5">Delphi
	</td>
  </tr>
  <tr>
	<th>졸업일</th>
	<td colspan="6" class="graduate_year1">
 <select name="graduate_year" style="width: 80px;" id="year" onchange="yearChk()"> <!-- onchange 변화됐을 때(셀렉트박스) 발생되는 이벤트 -->
      <option value="00"></option>
      <c:forEach var="i" begin="1980" end="2017" step="1">
      <option value="${i}">${i}</option>
      </c:forEach>
   </select>년
   <select name="graduate_month" style="width: 80px;" id="month" onchange="monthChk()">
      <option></option>
      <option value="01">01</option>
      <option value="02">02</option>
      <option value="03">03</option>
      <option value="04">04</option>
      <option value="05">05</option>
      <option value="06">06</option>
      <option value="07">07</option>
      <option value="08">08</option>
      <option value="09">09</option>
      <c:forEach var="i" begin="10" end="12" step="1">
      <option <option value="${i}" ${month1 eq i?"selected":""}>${i}</option>></option>
      </c:forEach>
   </select>월
   <select name="graduate_day" style="width: 80px;" id="day" onchange="dayChk()">
      <option></option>
      <option value="01">01</option>
      <option value="02">02</option>
      <option value="03">03</option>
      <option value="04">04</option>
      <option value="05">05</option>
      <option value="06">06</option>
      <option value="07">07</option>
      <option value="08">08</option>
      <option value="09">09</option>
      <c:forEach var="i" begin="10" end="31" step="1">
      <option value="${i}" ${day1 eq i?"selected":""}>${i}</option>
      </c:forEach>
   </select>일
   <input type="hidden" name="date1" id="date1">
</td>
  </tr>
  <tr>
	<td colspan="4" class="input_button">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="submit"  value="사원등록" style="width: 200px;">
	
	</td>
	<td colspan="2" class="reset_button">
	<input type="reset" value="초기화">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</td>
  </tr>
  </table>
 </form> 
</body>
</html>