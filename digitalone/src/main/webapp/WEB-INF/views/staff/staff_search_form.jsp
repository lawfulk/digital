<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
   /* width: 800px; */
   margin: 0px auto;
  /*  border-top: 1px solid #BDBDBD; */
/*    border-right: 1px solid #BDBDBD;
   border-left: 1px solid #BDBDBD; */
   border-spacing: 0px;
}

table th {
   /* width: 200px; */
   border-bottom: 1px solid #BDBDBD;
  /*  border-right: 1px solid #BDBDBD; */
   background-color: #EAEAEA;
}

table td {
   /* width: 550px; */
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

/* 짝수 줄 노란색 선  tr-> even class (2n+1)*/
.even:nth-child(2n+2) { 
        background: #E7E7E7;
}

/* hover - 마우스가 올라가 있는상태를 가르킨다. http://zzarungna.tistory.com/25*/
tr.even:hover {
         background:#C3C3C3;
}


/* .re1{
   border-bottom: none;
   border-left: none;
   border-right: none;
}
.re2{
   border-bottom: none;
   border-left: none;
   border-right: none;
}*/
.re3{
   text-align: right;

}

/* 솔트 화살표 이미지 */
	th.sorted.ascending:after {
		content: "  \2191";
	}

	th.sorted.descending:after {
		content: " \2193";
	}
/*  */
</style>
<!--  -->
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script> <!-- j쿼리 항상 최신버전 사용 -->
<!--  -->


<script>
$(document).ready(function(){ /* $(document).ready(function(){ 제이쿼리 기본 셋팅 */
   console.log("111");
   $("#btn").on("click", function(){
      console.log("진입");
      var year = $("select[name='year1'] option:selected").val();
      console.log(year);
   });
   
/*    $("checkbox").on("click",funtion(){
		consol.log("진입");
		var checkedbox ="";
	      $('#checkbox:checked').each(function() { 
	         checkedSex +=$(this).val();
	      });
	    console.log("checkedbox: "+ checkedbox);
	}) */
   
    $("#form").submit(function(){ //폼의 서브밋을 누르면 이 매서드를 수행 (년월일 다 체크 후 검색버튼 누르면 '시작년도가 더 큽니다 '경고창) 제이쿼리
      var year1 = $("#year1").val();
      var month1 = $("#month1").val();
      var day1 = $("#day1").val();
      var year2 = $("#year2").val();
      var month2 = $("#month2").val();
      var day2 = $("#day2").val();
   
      var date1 = new Date(year1,month1,day1);
      var date2 = new Date(year2,month2,day2);
      
      if(date1.getTime() > date2.getTime()){
         window.alert('시작년도가 더 큽니다.');
         return false;
      }else{
         var date_1;
         var date_2;
         if(year1==00){
            date_1 = '';
            date_2 = '';
         }else{
            date_1 = year1+"-"+month1+"-"+day1;
            date_2 = year2+"-"+month2+"-"+day2;
         }
         
         document.getElementById("date1").value = date_1;
         document.getElementById("date2").value = date_2;
         return true;
      }
   }); 
});

function yearChk(){
   // var는 String int와 같은 자료형
   // ex) var a = 0;;

   var a = document.getElementById("year1").value; /*"year1"만하면 오브젝트(아이디값)만 가져가고 .value 를 붙여야 해당 벨류값을 가져올 수 있다. */
   
   if (a==00) { // a(year1)값이 option value=00 과 같으면 month1,day1의 id 값이 0으로 초기화 된다.
      document.getElementById("month1").selectedIndex=0;
      document.getElementById("day1").selectedIndex=0;
   } else{
      document.getElementById("month1").selectedIndex=1;
      document.getElementById("day1").selectedIndex=1;
   }

}

function monthChk(){ //월 먼저 체크하면 경고창
   
   var a = document.getElementById("year1").value; /*"year1"만하면 오브젝트(아이디값)만 가져가고 .value 를 붙여야 해당 벨류값을 가져올 수 있다. */
   
   if (a==00) { // a(year1)값이 option value=00 과 같으면 month1,day1의 id 값이 0으로 초기화 된다.
      window.alert("년도를 먼저 선택하세요");
      document.getElementById("month1").selectedIndex=0;
   }
}
function dayChk(){ //일 먼저 체크하면 경고창
   
   var a = document.getElementById("year1").value; /*"year1"만하면 오브젝트(아이디값)만 가져가고 .value 를 붙여야 해당 벨류값을 가져올 수 있다. */
   
   if (a==00) { // a(year1)값이 option value=00 과 같으면 month1,day1의 id 값이 0으로 초기화 된다.
      window.alert("년도를 먼저 선택하세요");
      document.getElementById("day1").selectedIndex=0;
   }
}
/*  */
function yearChk2(){
   // var는 String int와 같은 자료형
   // ex) var a = 0;;

   var a = document.getElementById("year2").value; /*"year1"만하면 오브젝트(아이디값)만 가져가고 .value 를 붙여야 해당 벨류값을 가져올 수 있다. */
   var b = document.getElementById("year1").value;
/*    if (a==00) { // a(year1)값이 option value=00 과 같으면 month1,day1의 id 값이 0으로 초기화 된다.
      document.getElementById("month2").selectedIndex=0;
      document.getElementById("day2").selectedIndex=0;
   } else{
      document.getElementById("month2").selectedIndex=1; // 
      document.getElementById("day2").selectedIndex=1;   // 아래 주석 풀면 위아래 삭제 */
       if(b>a){
         window.alert('시작년도가 더 큽니다.');
         document.getElementById("year2").selectedIndex=0;
         document.getElementById("month2").selectedIndex=0;
         document.getElementById("day2").selectedIndex=0;
      }else{
      
         document.getElementById("month2").selectedIndex=12;
         document.getElementById("day2").selectedIndex=31;
      } 

   }



function monthChk2(){ //월 먼저 체크하면 경고창
   
   var a = document.getElementById("year2").value; /*"year1"만하면 오브젝트(아이디값)만 가져가고 .value 를 붙여야 해당 벨류값을 가져올 수 있다. */
   
   if (a==00) { // a(year1)값이 option value=00 과 같으면 month1,day1의 id 값이 0으로 초기화 된다.
      window.alert("년도를 먼저 선택하세요");
      document.getElementById("month2").selectedIndex=0;
   }
}
function dayChk2(){ //일 먼저 체크하면 경고창
   
   var a = document.getElementById("year2").value; /*"year1"만하면 오브젝트(아이디값)만 가져가고 .value 를 붙여야 해당 벨류값을 가져올 수 있다. */
   
   if (a==00) { // a(year1)값이 option value=00 과 같으면 month1,day1의 id 값이 0으로 초기화 된다.
      window.alert("년도를 먼저 선택하세요");
      document.getElementById("day2").selectedIndex=0;
   }
   
}

function open_staff_input_form(){
	window.open('staff_input_form.do','login','width=900, height=150, left=300, top=200');
}
/* function open_staff_updel_form(){
	window.open('staff_updel_form.do','login','width=900, height=150, left=300, top=200');
} */
function open_staff_updel_form(staff_no){
	   window.open('staff_updel_form.do?staff_no='+staff_no,'login','width=900, height=150, left=300, top=200');
	}
	
	function page(){
		var pagenum = document.getElementById('page1').value;
		location.href='staff_search_all.do?pagenum='+pagenum;
	}
</script>


<body>
<form name="all" action="staff_search_form.do" method="post" id="form">
  <table>
  <tr>
   <th colspan="6">사원 정보 검색</th>
  </tr>
  <tr>
   <th>키워드</th> <!-- id="name" -> 검색 히스토리 남김 -->
   <td><input type="text" name="name" id="name" value="${name}"></td> 
   <th>성별</th>
   
   <td><input type="checkbox" id="sok1"name="sex" value="1" ${sex eq '1'?"checked":""}>남
      <input type="checkbox" id="sok2" name="sex" value="2" ${sex eq '2'?"checked":""}>여
      
      <c:forEach items="${sex}" varStatus="status">
      <!-- [${status.index}]: ${sex[status.index]} --> 
         <c:forEach var="z" begin="1" end="2" step="1">   
            <c:if test="${sex[status.index]==z}"><!-- z는 1~3까지 돌고, 위에 foreach는 school_code사이즈 만큼 돔, school_code는 arraylist타입이라 school_code[0]==1인지,2인지,3인지 검사하고,school_code[1]==1인지,2인지,3인지 검사하고,school_code[2]==1인지,2인지,3인지 검사함  -->
                  <script>
                  var elem = ${z};
                  document.getElementById("sok"+elem+"").checked=true;
                  </script>
                  </c:if>
         </c:forEach>      
      </c:forEach>
      
      
   </td>
   
   <th>종교</th>
   <td><select name="religion_code" style="width: 100px;">
      <option></option>
      <option value="1" ${religion_code eq '1'?"selected":""}>기독교</option>
      <option value="2" ${religion_code eq '2'?"selected":""}>천주교</option>
      <option value="3" ${religion_code eq '3'?"selected":""}>불교</option>
      <option value="4" ${religion_code eq '4'?"selected":""}>이슬람</option>
      <option value="5" ${religion_code eq '5'?"selected":""}>무교</option>
   </select></td>
  </tr>
  <tr>
   <th>학력</th>
   <td style="padding-right: 15px;">
<!--        <h2>[${status.index}]: ${arr_school_code[status.index]}</h2> -->
      <input type="checkbox" id="ok1" name="school_code" value="1" ${school_code eq '1'?"checked":""}>고졸
      <input type="checkbox" id="ok2" name="school_code" value="2" ${school_code eq '2'?"checked":""}>전문대졸
      <input type="checkbox" id="ok3" name="school_code" value="3" ${school_code eq '3'?"checked":""}>일반대졸
      
      <c:forEach items="${school_code}" varStatus="status">
      <!-- [${status.index}]: ${school_code[status.index]}  -->
         <c:forEach var="z" begin="1" end="3" step="1">   
            <c:if test="${school_code[status.index]==z}"><!-- z는 1~3까지 돌고, 위에 foreach는 school_code사이즈 만큼 돔, school_code는 arraylist타입이라 school_code[0]==1인지,2인지,3인지 검사하고,school_code[1]==1인지,2인지,3인지 검사하고,school_code[2]==1인지,2인지,3인지 검사함  -->
                  <script>
                  var elem = ${z};
                  document.getElementById("ok"+elem+"").checked=true;
                  </script>
                  </c:if>
         </c:forEach>      
      </c:forEach>
      
   </td>
   <th>기술</th>
   <td colspan="3" style="padding-right: 100px;">
      <input type="checkbox" id="kok1" name="skill_code" value="1" ${skill_code eq '1'?"checked":""}>JAVA<!-- 그럼 여기도 잘되어하는데 남ㅇ도 체크박스는 풀리는뎅 ㅎㅎ -->
      <input type="checkbox" id="kok2" name="skill_code" value="2" ${skill_code eq '2'?"checked":""}>JSP
      <input type="checkbox" id="kok3" name="skill_code" value="3" ${skill_code eq '3'?"checked":""}>ASP
      <input type="checkbox" id="kok4" name="skill_code" value="4" ${skill_code eq '4'?"checked":""}>PHP
      <input type="checkbox" id="kok5" name="skill_code" value="5" ${skill_code eq '5'?"checked":""}>Delphi
      
         <c:forEach items="${skill_code}" varStatus="status">
      <!-- [${status.index}]: ${skill_code[status.index]} --> 
         <c:forEach var="z" begin="1" end="5" step="1">   
            <c:if test="${skill_code[status.index]==z}"><!-- z는 1~3까지 돌고, 위에 foreach는 school_code사이즈 만큼 돔, school_code는 arraylist타입이라 school_code[0]==1인지,2인지,3인지 검사하고,school_code[1]==1인지,2인지,3인지 검사하고,school_code[2]==1인지,2인지,3인지 검사함  -->
                  <script>
                  var elem = ${z};
                  document.getElementById("kok"+elem+"").checked=true;
                  </script>
                  </c:if>
         </c:forEach>      
      </c:forEach>
      
   </td>
  </tr>
  <tr>
   <th>졸업일</th>
   <td colspan="6">
   <!--  -->
   <select name="year1" style="width: 80px;" id="year1" onchange="yearChk()"> <!-- onchange 변화됐을 때(셀렉트박스) 발생되는 이벤트 -->
      <option value="00"></option>
      <c:forEach var="i" begin="1980" end="2017" step="1">
      <option value="${i}" ${year1 eq i?"selected":""}>${i}</option>
      </c:forEach>
   </select>년
   <select name="month1" style="width: 80px;" id="month1" onchange="monthChk()">
      <option></option>
      <option value="01"${month1 eq '01'?"selected":""}>01</option>
      <option value="02"${month1 eq '02'?"selected":""}>02</option>
      <option value="03"${month1 eq '03'?"selected":""}>03</option>
      <option value="04"${month1 eq '04'?"selected":""}>04</option>
      <option value="05"${month1 eq '05'?"selected":""}>05</option>
      <option value="06"${month1 eq '06'?"selected":""}>06</option>
      <option value="07"${month1 eq '07'?"selected":""}>07</option>
      <option value="08"${month1 eq '08'?"selected":""}>08</option>
      <option value="09"${month1 eq '09'?"selected":""}>09</option>
      <c:forEach var="i" begin="10" end="12" step="1">
      <option <option value="${i}" ${month1 eq i?"selected":""}>${i}</option>></option>
      </c:forEach>
   </select>월
   <select name="day1" style="width: 80px;" id="day1" onchange="dayChk()">
      <option></option>
      <option value="01"${day1 eq '01'?"selected":""}>01</option>
      <option value="02"${day1 eq '02'?"selected":""}>02</option>
      <option value="03"${day1 eq '03'?"selected":""}>03</option>
      <option value="04"${day1 eq '04'?"selected":""}>04</option>
      <option value="05"${day1 eq '05'?"selected":""}>05</option>
      <option value="06"${day1 eq '06'?"selected":""}>06</option>
      <option value="07"${day1 eq '07'?"selected":""}>07</option>
      <option value="08"${day1 eq '08'?"selected":""}>08</option>
      <option value="09"${day1 eq '09'?"selected":""}>09</option>
      <c:forEach var="i" begin="10" end="31" step="1">
      <option value="${i}" ${day1 eq i?"selected":""}>${i}</option>
      </c:forEach>
   </select>일
   <input type="hidden" name="date1" id="date1">
   ~
   <select name="year2" style="width: 80px;" id="year2" onchange="yearChk2()">
      <option></option>
      <c:forEach var="i" begin="1980" end="2017" step="1">
      <option value="${i}"${year2 eq i?"selected":""}>${i}</option>
      </c:forEach>
   </select>년
   <select name="month2" style="width: 80px;" id="month2" onchange="monthChk2()">
      <option></option>
      <option value="01"${month2 eq '01'?"selected":""}>01</option>
      <option value="02"${month2 eq '02'?"selected":""}>02</option>
      <option value="03"${month2 eq '03'?"selected":""}>03</option>
      <option value="04"${month2 eq '04'?"selected":""}>04</option>
      <option value="05"${month2 eq '05'?"selected":""}>05</option>
      <option value="06"${month2 eq '06'?"selected":""}>06</option>
      <option value="07"${month2 eq '07'?"selected":""}>07</option>
      <option value="08"${month2 eq '08'?"selected":""}>08</option>
      <option value="09"${month2 eq '09'?"selected":""}>09</option>
      <c:forEach var="i" begin="10" end="12" step="1">
      <option <option value="${i}" ${month1 eq i?"selected":""}>${i}</option>></option>
      </c:forEach>
   </select>월
   <select name="day2" style="width: 80px;" id="day2" onchange="dayChk2()">
      <option></option>
      <option value="01"${day2 eq '01'?"selected":""}>01</option>
      <option value="02"${day2 eq '02'?"selected":""}>02</option>
      <option value="03"${day2 eq '03'?"selected":""}>03</option>
      <option value="04"${day2 eq '04'?"selected":""}>04</option>
      <option value="05"${day2 eq '05'?"selected":""}>05</option>
      <option value="06"${day2 eq '06'?"selected":""}>06</option>
      <option value="07"${day2 eq '07'?"selected":""}>07</option>
      <option value="08"${day2 eq '08'?"selected":""}>08</option>
      <option value="09"${day2 eq '09'?"selected":""}>09</option>
      <c:forEach var="i" begin="10" end="31" step="1">
      <option value="${i}" ${day1 eq i?"selected":""}>${i}</option>
      </c:forEach>
   </select>일
   <input type="hidden" name="date2" id="date2">
   <!--  -->
  </td>
  </tr>
  <tr>
   <td class="re1" colspan="4" align="center"  style="border-bottom: none;" >
   <input type="submit" id="btn" value="검색" style="width: 200px;">
   </td>
   <td class="re2" colspan="2" style="border-bottom: none;">
   <input type="button" value="전부검색" onclick="javascript:location.href='staff_search_all.do'">
   <input type="button" value="초기화" onclick="javascript:location.href='staff_search_form.do'">
   <a href="javascript:open_staff_input_form()"><input type="button"  value="등록"></a>
  <!--  <a href="test.do"><input type="button"  value="등록(테스트)"></a> -->
   </td>
  </tr>
  </table>
    <input type="hidden" name="cp" id="cp" value="1">
 </form> 
  
<br>
<br>
<table>
   <thead>
   	<tr>
   		<td colspan="6">
   		<select name="page" style="width: 80px;" id="page1" onchange="page()">
	      <c:forEach var="i" begin="10" end="30" step="1">
	      <option value="${i}" ${pagenum eq i?"selected":""}>${i}</option>
	      </c:forEach>
   		</select>
   		</td>
   	</tr>
      <tr>
         <td class="re3" colspan="6">검색건수-->${all_find_cnt}건</td>
      </tr>
      <tr>
         <th class="no-sort">번호</th>
         <th style="cursor:pointer">이름</th>
         <th style="cursor:pointer">성별</th>
         <th style="cursor:pointer">종교</th>
         <th style="cursor:pointer">졸업일</th>
         <th class="no-sort">수정/삭제</th>
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
      <tr class="even">
         <td>${dto.staff_no}</td>
         <td>${dto.staff_name}</td>
         <td>${dto.jumin_no}</td>
         <td>${dto.religion_name}</td>
         <td>${dto.graduate_day}</td> 
         <td><a href="javascript:open_staff_updel_form(${dto.staff_no})"><input type="button" name="redel" value="수정/삭제"></a></td>
         <!-- <td><input type="button" name="redel" value="수정/삭제" onclick="location.href='staff_updel_form.do?staff_no=${dto.staff_no}'"></td>  
         	  onclick="location.href= 페이지 이동, 팝업 띄울려면 window.open-->
      </tr>
      </c:forEach>
   </tbody>
   <tfoot>
      <tr>
         <td colspan="6" align="center" style="border-bottom: none;">
         
         <c:forEach var="i" begin="1" end="${totalPage}" step="1">
            <span onclick="myFunc(${i})" style="cursor: pointer;">${i}</span>
         </c:forEach>   
            <script>
            myFunc = function(i){
               console.log("test i : "+i);
               document.getElementById('cp').value=i;
               document.getElementById('form').submit();
               
            }
            </script>
         
         
         
         </td>
      </tr>
   </tfoot>
   
</table>
<!---------------------------- 솔트 관련 제이쿼리 시작 ------------------------------>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function() {

	var $ = window.Zepto || window.jQuery;

	$.tablesort = function ($table, settings) {
		var self = this;
		this.$table = $table;
		this.$thead = this.$table.find('thead');
		this.settings = $.extend({}, $.tablesort.defaults, settings);
		this.$table.find('th:not(.no-sort)').bind('click.tablesort', function() {
			self.sort($(this));
		});
		this.index = null;
		this.$th = null;
		this.direction = null;
	};

	$.tablesort.prototype = {

		sort: function(th, direction) {
			var start = new Date(),
				self = this,
				table = this.$table,
				body = table.find('tbody').length > 0 ? table.find('tbody') : table,
				rows = this.$thead.length > 0 ? table.find('tbody tr') : table.find('tr').has('td'),
				cells = table.find('tr td:nth-of-type(' + (th.index() + 1) + ')'),
				sortBy = th.data().sortBy,
				sortedMap = [];

			var unsortedValues = cells.map(function(idx, cell) {
				if (sortBy)
					return (typeof sortBy === 'function') ? sortBy($(th), $(cell), self) : sortBy;
				return ($(this).data().sortValue != null ? $(this).data().sortValue : $(this).text());
			});
			if (unsortedValues.length === 0) return;

			self.$table.find('th').removeClass(self.settings.asc + ' ' + self.settings.desc);

			if (direction !== 'asc' && direction !== 'desc')
				this.direction = this.direction === 'asc' ? 'desc' : 'asc';
			else
				this.direction = direction;

			direction = this.direction == 'asc' ? 1 : -1;

			self.$table.trigger('tablesort:start', [self]);
			self.log("Sorting by " + this.index + ' ' + this.direction);

			for (var i = 0, length = unsortedValues.length; i < length; i++)
			{
				sortedMap.push({
					index: i,
					cell: cells[i],
					row: rows[i],
					value: unsortedValues[i]
				});
			}

			sortedMap.sort(function(a, b) {
				if (a.value > b.value) {
					return 1 * direction;
				} else if (a.value < b.value) {
					return -1 * direction;
				} else {
					return 0;
				}
			});

			$.each(sortedMap, function(i, entry) {
				body.append(entry.row);
			});

			th.addClass(self.settings[self.direction]);

			self.log('Sort finished in ' + ((new Date()).getTime() - start.getTime()) + 'ms');
			self.$table.trigger('tablesort:complete', [self]);
		},

		log: function(msg) {
			if(($.tablesort.DEBUG || this.settings.debug) && console && console.log) {
				console.log('[tablesort] ' + msg);
			}
		},

		destroy: function() {
			this.$table.find('th').unbind('click.tablesort');
			this.$table.data('tablesort', null);
			return null;
		}

	};

	$.tablesort.DEBUG = false;

	$.tablesort.defaults = {
		debug: $.tablesort.DEBUG,
		asc: 'sorted ascending',
		desc: 'sorted descending'
	};

	$.fn.tablesort = function(settings) {
		var table, sortable, previous;
		return this.each(function() {
			table = $(this);
			previous = table.data('tablesort');
			if(previous) {
				previous.destroy();
			}
			table.data('tablesort', new $.tablesort(table, settings));
		});
	};

});

</script>
<script type="text/javascript">
	$(function() {
		$('table').tablesort().data('tablesort');
	});
</script>
<!---------------------------- 솔트 관련 제이쿼리 끝 ------------------------------>
</body>
</html>











