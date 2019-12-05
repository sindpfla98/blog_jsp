<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Start of Main Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
	  <h1 class="h3 mb-0 text-gray-800">${breadcrumbItem}</h1>
	  <h3 class="h6 mb-0 text-gray-800">회원등록 프로그램</h3>
	</div>
	<!-- Content Row 사이즈 조정 col-md-6 (1~12) -->

	<form>
    <div class="input-group col-md-3 mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">Default12345</span>
      </div>
      <input type="text" class="form-control">
    </div>
    <div class="input-group col-md-10 mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">Default</span>
      </div>
      <input type="text" class="form-control">
    </div>
    <div class="input-group col-md-3 mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">Default</span>
      </div>
      <input type="text" class="form-control">
    </div>
  </form>
</div>
<!-- /.container-fluid -->
