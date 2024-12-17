<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="/admin/css/admin_main.css">
    <script src="/admin/script/jquery-3.7.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="/admin/script/admin.js"></script>
</head>
<body>
<!-- <%--  여기부터가 header  --%> -->
<div class="wrap">
    <div class="side_bar">
        <div id="admin_container">
            <h1>관리자 페이지</h1>
            <div id="adminid">${loginAdmin.name}님</div>
        </div>
        <div class="side_menu">
            <a href="/admin">WebtoonList</a>
            <a href="/adminQnalist">Q&AList</a>
            <a href="/adminNoticelist">NoticeList</a>

            <div class="info">
                <div>총 회원 수 : ${memberCount}</div>
                <div>총 웹툰 수 : ${webtoonCount}</div>
            </div>
        </div>
    </div>

