<%@page import="kr.ac.shu.notice.NoticeDTO"%>
<%@page import="kr.ac.shu.notice.NoticeDAO"%>
<%@page import="kr.ac.shu.db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	int idx = Integer.parseInt(request.getParameter("idx"));
	String idxString = request.getParameter("idx");
	
	//공지사항 상세 보기
	NoticeDTO notice = new NoticeDTO();
	Connection con1 = DBConnection.openConnection();
	NoticeDAO dao2 = new NoticeDAO(con1);
	notice = dao2.selectNoticeIdxData(idx);
	DBConnection.closeConnection(con1);
	
%>
<!-- Start of Main Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
	  <h1 class="h3 mb-0 text-gray-800">${breadcrumbItem}</h1>
	</div>
	<!-- Content Row -->

	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<!-- 공지사항 추가 -->				
			<h6 class="m-0 font-weight-bold text-primary">DB보기 예제</h6>
		</div>
         <div class="card-body">
         	<table class="table table-bordered">
			<colgroup>
			<col width="150"></col>
			<col></col>
			</colgroup>
				<tbody>
				<tr>
					<th class="bg-faded">등록일시</th>
					<td><fmt:formatDate value="<%=notice.getCreated()%>" pattern="yyyy년 MM월 dd일 HH시 mm분"/></td>
				</tr>
				<tr>
					<th class="bg-faded">작성자</th>
					<td><%=notice.getName()%></td>
				</tr>
				<tr>
					<th class="bg-faded">이메일</th>
					<td><%=notice.getEmail()%></td>
				</tr>
				<tr>
					<th class="bg-faded">전화번호</th>
					<td><%=notice.getPhone()%></td>
				</tr>
				<tr>
					<th class="bg-faded">주소</th>
					<td>
						<%=notice.getAddress()%>
					</td>
				</tr>
				<tr>
					<th class="bg-faded">수정일시</th>
					<td><fmt:formatDate value="<%=notice.getUpdated()%>" pattern="yyyy년 MM월 dd일 HH시 mm분"/></td>
				</tr>
				</tbody>
			</table>
			<!--// 보기 -->
			<!--// 버튼 -->
		  <a class="btn btn-primary waves-effect waves-light" href="<c:url value='/views/dashboard/index_new.jsp' />">목록</a>
			<a class="btn btn-warning waves-effect waves-light" href="<c:url value='../dashboard/index_new.jsp?vmenu=/views/notice/edit.jsp'/>?idx=<%=notice.getIdx()%>">수정</a>					
			<a class="btn btn-danger waves-effect waves-light" href="<c:url value='../dashboard/index_new.jsp?vmenu=/views/notice/delete.jsp' />?idx=<%=notice.getIdx()%>">삭제</a>
			<!--// 버튼 -->
		</div>
	</div>
</div>
      
			