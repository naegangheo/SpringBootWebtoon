<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="admin/css/admin_main.css">
    <script src="script/jquery-3.7.1.min.js"></script>
</head>
<body>
<!-- <%--  여기부터가 header  --%> -->
<div class="wrap">
    <div class="side_bar">
        <div class="side_title">
            <h1>관리자 페이지</h1>
        </div>
        <br>
        <div>${loginAdmin.name}님</div>
        <div class="info">
            <div>총 회원 수 :  ${memberCount}</div>
            <div>총 웹툰 수 :  ${webtoonCount}</div>
        </div>
    </div>

    <div class="admin_view">
        <div class="top">
            <div class="top_menu">
                <a href="/admin">WebtoonList</a>
                <a href="/adminQnalist">Q&AList</a>
                <a href="/adminNoticelist">NoticeList</a>
            </div>
            <div class="logo">LOGO</div>
        </div>
