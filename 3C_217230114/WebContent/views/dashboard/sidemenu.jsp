<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

	  <!-- Sidebar -->
	  <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
		<!-- Sidebar - Brand -->
		<a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value='/views/dashboard/index_new.jsp' />">
		  <div class="sidebar-brand-icon rotate-n-15">
		    <i class="fas fa-laugh-wink"></i>
		  </div>
		  <div class="sidebar-brand-text mx-3">회원관리</div>
		</a>
		<!-- Heading -->
		<div class="sidebar-heading">메인메뉴</div>
	
		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item">
		  <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo_1" aria-expanded="true" aria-controls="collapseTwo">
		    <i class="fas fa-fw fa-cog"></i>
		    <span>회원관리</span>
		  </a>
		  <div id="collapseTwo_1" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		    <div class="bg-white py-2 collapse-inner rounded">
		      <a class="collapse-item" href="<c:url value='../dashboard/index_new.jsp?vmenu=/views/member/member_insert.jsp' />">1_1.회원등록</a>
		      <a class="collapse-item" href="<c:url value='../dashboard/index_new.jsp?vmenu=/views/member/member_list.jsp' />">1_2.회원목록조회</a>
		      <a class="collapse-item" href="<c:url value='../dashboard/index_new.jsp?vmenu=/views/member/member_insert.jsp' />">1_3.회원매출조회</a>
		    </div>
		  </div>
		</li>

		
		<li class="nav-item">
      <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo_2" aria-expanded="true" aria-controls="collapseTwo">
        <i class="fas fa-fw fa-cog"></i>
        <span>구매관리</span>
      </a>
      <div id="collapseTwo_2" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <a class="collapse-item" href="<c:url value='../dashboard/index_new.jsp?vmenu=/views/notice/add.jsp' />">2_1.회원등록</a>
          <a class="collapse-item" href="#">2_2.회원목록조회</a>
          <a class="collapse-item" href="#">2_3.회원매출조회</a>
        </div>
      </div>
    </li>
    <!-- 구분선 -->
    <hr class="sidebar-divider d-none d-md-block">
    
    
	  </ul>
	  <!-- End of Sidebar -->
