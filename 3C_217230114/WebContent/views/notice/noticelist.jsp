<%@page import="kr.ac.shu.notice.NoticeDAO"%>
<%@page import="kr.ac.shu.db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.shu.notice.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	//공지사항 목록 데이터베이스 검색(연동)
	ArrayList<NoticeDTO> noticeList = new ArrayList<NoticeDTO>();
	Connection con1 = DBConnection.openConnection();
	NoticeDAO dao1 = new NoticeDAO(con1);
	noticeList = dao1.selectNoticeAllData();
	DBConnection.closeConnection(con1);
	//----------------------------------------------------------------------
	//  action에서 객체를 request에 담을 때. request.setAttribute("객체명", 객체);
	request.setAttribute("noticeList", noticeList);
	//----------------------------------------------------------------------
%>

<!---------------------------- Start of container-fluid ------------------------------>
<div class="container-fluid">
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
	  <h1 class="h3 mb-0 text-gray-800">${breadcrumbItem}</h1>
	</div>
	
	<!-- Content Row -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
		  <h6 class="m-0 font-weight-bold text-primary">Notice 테이블 목록 예제</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<thead>
					<tr>
					  <th>#</th>
					  <th>이름</th>
					  <th>이메일</th>
					  <th>연락처</th>
					  <th>주소</th>
					  <th>생성일</th>
					  <th>수정일</th>
					  <th>관리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="noticeList" items="${noticeList}" varStatus="status">
					<tr>
					<td>${status.index+1}</td>
					<td><a href="<c:url value='../dashboard/index_new.jsp?vmenu=/views/notice/view.jsp'/>?idx=${noticeList.idx}">${noticeList.name}</a></td>
					<td>${noticeList.email}</td>
					<td>${noticeList.phone}</td>
					<td>${noticeList.address}</td>
					<td><fmt:formatDate value="${noticeList.created}" pattern="yyyy-MM-dd HH:mm"/></td>
					<td><fmt:formatDate value="${noticeList.updated}" pattern="yyyy-MM-dd HH:mm"/></td>
					<td>				                   
           
          <a class="btn btn-warning waves-effect waves-light btn-sm" 
           href="<c:url value='../dashboard/index_new.jsp?vmenu=/views/notice/edit.jsp'/>?idx=${noticeList.idx}">수정</a>    
					<a type="button" class="btn btn-danger waves-effect waves-light btn-sm" 
					 href="<c:url value='/views/notice/delete.jsp' />?idx=${noticeList.idx}">삭제</a>
					</td>
					</tr> 				
					</c:forEach>
				</tbody>
			</table>
			</div>
			<div class="mt-3">
				<a class="btn btn-primary waves-effect waves-light" href="<c:url value='../dashboard/index_new.jsp?vmenu=/views/notice/add.jsp' />">
					등록
				</a>
			</div>
    	</div>
	</div>
	<!-- Content Row -->
</div>
<!----------------------------- End of container-fluid ------------------------------->
