<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Start of Main Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
	  <h1 class="h3 mb-0 text-gray-800">${breadcrumbItem}</h1>
	</div>
	<!-- Content Row 사이즈 조정 col-md-6 (1~12) -->

	<form id="member_insert_Form" method="post" action="<c:url value='/views/notice/member_insert_proc.jsp'/>">
		<div class="card shadow mb-4 col-md-8">
			<div class="card-header py-3">
				<!-- 공지사항 추가 -->				 
				<h6 class="m-0 font-weight-bold text-primary">회원등록</h6>
			</div>
	    <div class="card-body">				
		  		<div class="form-group col-md-3" >
	  					<label>회원번호(자동)</label>
					<input type="text" class="form-control" id="custno" name="custno">
		  		</div>
		  		<div class="form-group">
		    		<label>고객성명</label>
		    		<input type="text" class="form-control" id="custname" name="custname">
		  		</div>
		  		<div class="form-group">
		    		<label>연락처</label>
		    		<input type="text" class="form-control" id="phone" name="phone">
		  		</div>
		  		<div class="form-group">
		    		<label>회원주소</label>
		    		<input type="text" class="form-control" id="address" name="address">
		  		</div>
		  		<div class="form-group">
            <label>가입일자</label>
            <input type="text" class="form-control" id="joindate" name="joindate">         
          </div>
          
          <div class="form-group">
            <label>고객등급</label>
            <div class="form-check-inline ml-3">
            <label class="form-check-label">
              <input type="radio" class="form-check-input" name="grade" value= "A">VIP
            </label>
          </div>
          <div class="form-check-inline">
            <label class="form-check-label">
              <input type="radio" class="form-check-input" name="grade" value= "B">일반
            </label>
          </div>
          <div class="form-check-inline">
            <label class="form-check-label">
              <input type="radio" class="form-check-input" name="grade" value= "C">직원
            </label>
          </div>
          </div>

          <div class="form-group">
            <label>도시코드</label> 
            <select class="form-control" id="city" name="city">
			        <option value="10">[10]서울</option>
			        <option value="20">[20]대구</option>
			        <option value="30">[30]대전</option>
			        <option value="40">[40]부산</option>
			      </select>
          </div>
          
          
				  <!-- 공지사항 추가 버튼 -->
					<div>
						<button class="btn btn-primary waves-effect waves-light" type="submit" id="btnSubmit">
							등록
						</button>
						<a class="btn btn-secondary waves-effect waves-light" href="<c:url value='/views/dashboard/index_new.jsp'/>">
							목록
						</a>
					</div>	
			</div>
		</div>
	</form>
</div>
<!-- /.container-fluid -->
