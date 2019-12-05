<%@page import="kr.ac.shu.notice.NoticeDAO"%>
<%@page import="kr.ac.shu.db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.shu.notice.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	//공지사항 목록 검색
	ArrayList<NoticeDTO> noticeList = new ArrayList<NoticeDTO>();
	Connection con1 = DBConnection.openConnection();
	NoticeDAO dao1 = new NoticeDAO(con1);
	// System.out.println("NoticeDAO-1");
	noticeList = dao1.selectNoticeAllData();
	// System.out.println("selectNoticeAllData-2");
	DBConnection.closeConnection(con1);	
	// System.out.println("closeConnection-3");
	
	request.setAttribute("noticeList", noticeList);
%>


<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>한국대학교_샘플예제</title>

  <!-- Custom fonts for this template-->
  <link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css' />" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="<c:url value='/resources/css/sb-admin-2.min.css' />" rel="stylesheet">
</head>


<body id="page-top">
	<!-- b1)Page Wrapper -->
	<div id="wrapper">
	    <!-- Sidebar -->
	    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
			<!-- Sidebar - Brand -->
			<a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value='/views/dashboard/index.jsp' />">
			  <div class="sidebar-brand-icon rotate-n-15">
			    <i class="fas fa-laugh-wink"></i>
			  </div>
			  <div class="sidebar-brand-text mx-3">메인페이지</div>
			</a>
			<!-- Heading -->
			<div class="sidebar-heading">메뉴</div>
	
			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item">
			  <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
			    <i class="fas fa-fw fa-cog"></i>
			    <span>메뉴샘플</span>
			  </a>
			  <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
			    <div class="bg-white py-2 collapse-inner rounded">
			      <a class="collapse-item" href="#">하위메뉴1</a>
			      <a class="collapse-item" href="#">하위메뉴2</a>
			    </div>
			  </div>
			</li>
			<!-- 구분선 -->
			<hr class="sidebar-divider d-none d-md-block">
	    </ul>
	    <!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- Topbar start-->
				<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
					  <i class="fa fa-bars"></i>
					</button>
					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">
						<div class="topbar-divider d-none d-sm-block"></div>
						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow">
							<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							  <span class="mr-2 d-none d-lg-inline text-gray-600 small">한국대학교</span>
							  <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
							</a>
							<!-- Dropdown - User Information -->
							<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#">Profile</a>
								<a class="dropdown-item" href="#">Settings</a>
								<a class="dropdown-item" href="#">Activity Log</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
							</div>
						</li>
					</ul>
				</nav>
				<!-- End of Topbar -->
	
      	<!-- Start of Main Content -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<div class="d-sm-flex align-items-center justify-content-between mb-4">
					  <h1 class="h3 mb-0 text-gray-800">${breadcrumbItem}</h1>
					</div>
					<!-- Content Row -->
				 
					<div class="card shadow mb-4">
						<div class="card-header py-3">
						  <h6 class="m-0 font-weight-bold text-primary">테이블 예제</h6>
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
									<td><a href="<c:url value='/views/notice/view.jsp'/>?idx=${noticeList.idx}">${noticeList.name}</a></td>
									<td>${noticeList.email}</td>
									<td>${noticeList.phone}</td>
									<td>${noticeList.address}</td>
									<td><fmt:formatDate value="${noticeList.created}" pattern="yyyy-MM-dd HH:mm"/></td>
									<td><fmt:formatDate value="${noticeList.updated}" pattern="yyyy-MM-dd HH:mm"/></td>
									<td>
									<a class="btn btn-warning waves-effect waves-light btn-sm" href="<c:url value='/views/notice/edit.jsp'/>?idx=${noticeList.idx}">수정</a>					
									<a type="button" class="btn btn-danger waves-effect waves-light btn-sm" href="<c:url value='/views/notice/delete.jsp' />?idx=${noticeList.idx}">삭제</a>
									</td>
									</tr> 				
									</c:forEach>
								</tbody>
							</table>
							</div>
							<div class="mt-3">
								<a class="btn btn-primary waves-effect waves-light" href="<c:url value='/views/notice/add.jsp' />">
									등록
								</a>
							</div>
				    	</div>
					</div>
		  			<!-- Content Row -->
				</div>
		        <!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->
	
			<!-- Footer -->
			<footer class="sticky-footer bg-white">
			  <div class="container my-auto">
			    <div class="copyright text-center my-auto">
			      <span>Copyright &copy; 한국대학교 2019</span>
			    </div>
			  </div>
			</footer>
			<!-- End of Footer -->
		</div>
		<!-- End of Content Wrapper -->
		
	</div>
	<!-- b1) End of Page Wrapper -->


	<!-- Bootstrap core JavaScript-->
	<script src="<c:url value='/resources/vendor/jquery/jquery.min.js' />"></script>
	<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>
	
	<!-- Core plugin JavaScript-->
	<script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js' />"></script>
	
	<!-- Custom scripts for all pages-->
	<script src="<c:url value='/resources/js/sb-admin-2.min.js' />"></script>
</body>
</html>
