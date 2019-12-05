<%@page import="kr.ac.shu.notice.NoticeDAO"%>
<%@page import="kr.ac.shu.db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.shu.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	//idx 값
	int idx = Integer.parseInt(request.getParameter("idx"));
	String idxString = request.getParameter("idx");

	//공지사항 수정 정보 검색
	NoticeDTO notice = new NoticeDTO();
	Connection con1 = DBConnection.openConnection();
	NoticeDAO dao1 = new NoticeDAO(con1);
	notice = dao1.selectNoticeIdxData(idx);
	DBConnection.closeConnection(con1);
%>
	        	
<div class="container-fluid">
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
	  <h1 class="h3 mb-0 text-gray-800">${breadcrumbItem}</h1>
	</div>
	<!-- Content Row -->

	<form id="editForm" method="post" action="<c:url value='/views/notice/edit-proc.jsp'/>?idx=<%=notice.getIdx() %>">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<!-- 공지사항 추가 -->				
				<h6 class="m-0 font-weight-bold text-primary">DB수정 예제</h6>
			</div>
      <div class="card-body">				
		  		<div class="form-group">
   					<label>이름</label>
					<input type="text" class="form-control" id="name" name="name" value="<%=notice.getName()%>">
		  		</div>
		  		<div class="form-group">
		    		<label>이메일</label>
		    		<input type="text" class="form-control" id="email" name="email" value="<%=notice.getEmail()%>">
		  		</div>
		  		<div class="form-group">
		    		<label>연락처</label>
		    		<input type="text" class="form-control" id="phone" name="phone" value="<%=notice.getPhone()%>">
		  		</div>
		  		<div class="form-group">
		    		<label>주소</label>
		    		<input type="text" class="form-control" id="address" name="address" value="<%=notice.getAddress()%>">
		  		</div>
					<!-- 공지사항 추가 버튼 -->
					<div>
						<button class="btn btn-primary waves-effect waves-light" type="submit" id="btnSubmit">수정</button>
						<a class="btn btn-secondary waves-effect waves-light" href="<c:url value='/views/dashboard/index_new.jsp'/>">취소</a>
					</div>	
			</div>
		</div>
	</form>
</div>
  <!-- /.container-fluid -->
			