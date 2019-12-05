<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script language="javascript">
   function item_Insert() {
	   
      if(frmSaleCostInsert.empno.value == ""){
            alert("사원번호가 입력되지 않았습니다 !");
            frmSaleCostInsert.empno.focus();
            return false; } 

      if(frmSaleCostInsert.empdate.value == ""){
          alert("급여월이 입력되지 않았습니다");
          frmSaleCostInsert.empdate.focus();
          return false; }
      
      if(frmSaleCostInsert.empname.value == ""){
          alert("사원이름이 입력되지 않았습니다");
          frmSaleCostInsert.empname.focus();
          return false; }
      
      if(frmSaleCostInsert.deptcode.value == "0"){
          alert("부서번호가 선택되지 않았습니다");
          frmSaleCostInsert.deptcode.focus();
          return false; }
      if(frmSaleCostInsert.salary.value == ""){
          alert("본봉이 입력되지 않았습니다");
          frmSaleCostInsert.salary.focus();
          return false; }
      
      if(frmSaleCostInsert.bonus.value == ""){
          alert("상여금이 입력되지 않았습니다");
          frmSaleCostInsert.bonus.focus();
          return false; }

      //frmPersonInsert.action = "person_insert.do";
      //frmPersonInsert.submit();
      alert("수강등록이 정상적으로 등록 되었습니다!");      
   }

   function item_clear() {
	   alert("정보를 지우고 처음부터 다시 입력 합니다!");
	   document.getElementById('empno').value = '';
	   document.getElementById('empdate').value = '';
	   document.getElementById('empname').value = '';
	   document.getElementById('deptcode').value = '0';
	   document.getElementById('salary').value = '';
	   document.getElementById('bonus').value = '';
	   frmSaleCostInsert.classno.focus();
   }
</script>

<h2 align="center">사원등록</h2>
<form  name="frmSaleCostInsert" method="post" action="payroll_recp_action.jsp" onsubmit="item_Insert()">

<table border="1" align ="center">
  <tr><th align="center">사원번호 </th>
      <td align="left"><INPUT TYPE="text" name="empno"  id="empno" SIZE="15" > </td> 
  </tr>
  
  <tr><th align="center">급여월</th>
      <td align="left"><INPUT TYPE="text" name="empdate" id="empdate" SIZE="15" ></td>
  </tr>  
  
  <tr><th align="center">사원명</th>
      <td align="left"><INPUT TYPE="text" name="empname" id="empname" SIZE="15" ></td>
  </tr>  
  
  
  <tr><th align="center">부서명</th>
      <td align="left">
      <select id="deptcode" name="deptcode">
        <option value="0">부서명</option>
				<option value="1">[10] 경영</option>
				<option value="2">[20] 총무</option>
				<option value="3">[30] 전산</option>
				<option value="4">[40] 구매</option>
			</select>
      </td>
  </tr>   
  
  <tr><th align="center">본봉</th>
      <td align="left"><INPUT TYPE="text" name="salary" id="salary" SIZE="10" ></td>
  </tr>
  
    <tr><th align="center">상여금</th>
      <td align="left"><INPUT TYPE="text" name="bonus" id="bonus" SIZE="10" ></td>
  </tr>  

             
  <tr><td COLSPAN="2" style="width:400px">
  	<INPUT TYPE="submit" name="btnInsert"  value="사원등록 ">
  	<INPUT TYPE="button" name="btnRewrite" value="다시쓰기" ONCLICK="item_clear()"> 
  </td></tr>
</table>
</form>