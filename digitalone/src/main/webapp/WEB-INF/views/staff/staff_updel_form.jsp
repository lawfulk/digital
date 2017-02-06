<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
  margin-top: 
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
ul {
  list-style-type: none;
    margin-left: 350px;
    margin-top:  0px;
}
li {
  float: left;
  padding: 3px; 
}
</style>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(document).ready(function(){
	/*-- 종교 셀렉트 박스 ----------------------------------------------------------------------------*/
 	 var aa = ${dto.religion_code};
 	/* $("#religion_code option:eq(3)").attr("selected", "selected"); */
 	/*$("#religion_code").val("aa"); */
	console.log("종교코드:"+aa); 
 	

 	 if(aa == 1){
 	 	$("#religion_code").val("1");

	}else if(aa == 2){
	 	$("#religion_code").val("2");

	}else if(aa == 3){
	 	$("#religion_code").val("3");

	}else if(aa == 4){
	 	$("#religion_code").val("4");

	}else if(aa == 5){
	 	$("#religion_code").val("5");

	}  
 	/* 	 if(aa == 1){  위에 종교 코드와 같은 방식
	   document.staff_updel.religion_code.options[1].selected = true;
	}else if(aa == 2){
	   document.staff_updel.religion_code.options[2].selected = true;
	}else if(aa == 3){
	   document.staff_updel.religion_code.options[3].selected = true;
	}else if(aa == 4){
	   document.staff_updel.religion_code.options[4].selected = true;
	}else if(aa == 5){
	   document.staff_updel.religion_code.options[5].selected = true;
	}  */
	/*---------------------------------------------------------------------------------------*/
	

 	/*-- 스킬코드체크박스 ----------------------------------------------------------------------------*/
 	 var code = '${dto.contents}';
 	var skill = code.split(',');
 	var chk = document.getElementsByName("skill_code");
 	var chk_v = new Array();
 	for(var i =0;i<chk.length;i++){
 		chk_v.push(chk[i].value); //chk_v는 배열인데 배열에 하나씩 push해서 chk.value값을 넣겠다
 		console.log("스킬: "+skill[i]);
 		console.log("체크: "+chk_v[i]);
 		if(skill[i]==1){
 			 chk[i].checked = true;
 		}else if(skill[i]==2){
 			chk[i].checked = true;
 		}else if(skill[i]==3){
 			chk[i].checked = true;
 		}else if(skill[i]==4){
 			chk[i].checked = true;
 		}else if(skill[i]==5){
 			chk[i].checked = true;
 		}
 	} 
 	
 	   /* var skill = '${dto.contents}'.split(',');
 	   var cb = document.getElementsByName("skill_code");
 	   var cb_v  = new Array();      
 	   for(var i=0;i<cb.length;i++){
 	      cb_v[i]=cb[i].value;
 	      for(var j=2;j<5;j++){
 	         for(var k=0;k<cb.length;k++){
 	            if(skill[i]==j && cb[k].value==j){
 	               console.log(cb[k].value);
 	               cb[k].checked=true;
 	            }
 	         }
 	      }
 	   } */

  	/*---------------------------------------------------------------------------------------*/
 	 
 	/*-- 년 월 일 셀렉트 박스 ----------------------------------------------------------------------------*/
  	/* 년 */
 	var year1 = ${year1};
    console.log("년:"+year1);
    
    var length = document.staff_updel.graduate_year.options.length;
    for(var i=0; i<length; i++){
       if(document.staff_updel.graduate_year.options[i].value == year1){
    	   document.staff_updel.graduate_year.options[i].selected = true;
       }
    }
    
    /* 월 */
    var month1 = ${month1};
    console.log("월:"+month1);
    
    var length = document.staff_updel.graduate_month.options.length;
    for(var i=0; i<length; i++){
       if(document.staff_updel.graduate_month.options[i].value == month1){
    	   document.staff_updel.graduate_month.options[i].selected = true;
       }
    }
    
 	/* 일 */
 	var day1 = ${day1};
    console.log("일:"+day1);
    
    var length = document.staff_updel.graduate_day.options.length;
    for(var i=0; i<length; i++){
       if(document.staff_updel.graduate_day.options[i].value == day1){
    	   document.staff_updel.graduate_day.options[i].selected = true;
       }
    }
    
    /*---------------------------------------------------------------------------------------*/

    /* 학력  
    var school = ${dto.school_code};
    console.log("학력:"+school);
    var sc = document.getElementsByName("school_code");
    
    if(school == 1){
    	sc[0].ckecked=true;

	}else if(school == 2){
		sc[1].checked=true;

	}else if(school == 3){
		sc[2].checked=true;
    
	}*/
    
	
    /* 기술 */
    
/*     var skill = ${dto.skill_code};
    console.log("기술: "+skill)
    var re = document.getElementsByName("skill_code");
    
    if(skill == 1){
    	re[0].ckecked=true;

	}else if(skill == 2){
		re[1].checked=true;

	}else if(skill == 3){
		re[2].checked=true;
    
	}else if(skill == 4){
		re[3].checked=true;

	}else if(skill == 5){
		re[4].checked=true;
    
	} 	 */ 
 	// opener.document.reload(); 수정할때 부모페이지 리로딩 시키게(수정했던 정보들이 수정버튼을 누룬 후 부모 페이지에서 자동적으로 리로딩)
 	
});
</script>
<script>
function satffDelAlert(){
	
	if (!confirm("정말 삭제 하시겠습니까??")){ //취소
		
		return false;

	}else{   //확인
		document.form.submit ;
	}
}
</script>
<body>

<c:set var="dto" value="${dto}"/> <!-- ? -->
<form name="staff_updel" action="staff_updel_form.do" method="post" >
  <table>
  <tr>
	<th colspan="6">사원 정보 수정<input type="hidden" value="${dto.staff_no}"></th>
  </tr>
  <tr>
	<th>이름</th>
	<td><input type="text" name="staff_name" required value="${dto.staff_name}"></td>
	<th>주민번호</th>
	<td><input type="text" name="jumin_no1" style="width: 70px;" maxlength="6" onkeydown="return onlyNumber(event)" required value="${jumin1}"> -
		<input type="password" name="jumin_no2"  style="width: 70px;" maxlength="7" onkeydown="return onlyNumber2(event)" required value="${jumin2}">
	</td>
	<th>종교</th>
	<td><select name="religion_code" id="religion_code" style="width: 100px;" required>	
		<option value=""></option>
		<option value="1" >기독교</option>
		<option value="2">천주교</option>
		<option value="3">불교</option>
		<option value="4">이슬람</option>
		<option value="5">무교</option>
	</select></td>
  </tr>
  <tr>
	<th>학력</th>
	<td style="padding-right: 15px;">
		<input type="checkbox" name="school_code" value="1" ${dto.school_code eq '1'?"checked":""}>고졸
		<input type="checkbox" name="school_code" value="2" ${dto.school_code eq '2'?"checked":""}>전문대졸
		<input type="checkbox" name="school_code" value="3" ${dto.school_code eq '3'?"checked":""}>일반대졸
	</td>
	<th>기술</th>
	<td colspan="3" style="padding-right: 100px;">
		<input type="checkbox" name="skill_code" value="1" id="chb">JAVA
		<input type="checkbox" name="skill_code" value="2" id="chb">JSP
		<input type="checkbox" name="skill_code" value="3" id="chb">ASP
		<input type="checkbox" name="skill_code" value="4" id="chb">PHP
		<input type="checkbox" name="skill_code" value="5" id="chb"ㅁ>Delphi 

	</td>
  </tr> 
  <tr>
	<th>졸업일</th>
	<td colspan="6" class="graduate_year1">
 <select name="graduate_year" style="width: 80px;"> <!-- onchange 변화됐을 때(셀렉트박스) 발생되는 이벤트 -->
      <option value="00"></option>
      <c:forEach var="i" begin="1980" end="2017" step="1">
      <option value="${i}">${i}</option>
      </c:forEach>
   </select>년
   <select name="graduate_month" style="width: 80px;">
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
   <select name="graduate_day" style="width: 80px;">
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
 <!--  <tr>
	<td colspan="6" class="input_button" align="right">

	</td>
  </tr> -->
  </table>
  <ul>
  	<li><input type="submit"  value="수정"></li>
 </form> 
 
 <form name="delete" action ="delete.do" onsubmit="return satffDelAlert()">
 <input type="hidden" name="staff_no" value="${dto.staff_no}">
 <li><input type="submit" value="삭제"></li>
 </ul>
 </form>
</body>
</html>