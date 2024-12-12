<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="admin/css/admin_main.css">
    <script src="script/jquery-3.7.1.min.js"></script>
    <script>
        $(function(){
            $(".side_menu a").mouseenter(function(){
                var num=$(this).index();
                $(".side_menu a").css('opacity',"0.5");
                $(".side_menu a").eq(num).css('opacity',"1");
            });

            $(".side_menu a").mouseleave(function(){
                $(".side_menu a").css("opacity","0.5");
            });

        });
    </script>


</head>
<body>
<!-- <%--  여기부터가 header  --%> -->
<div class="wrap">
    <div class="side_bar">
        <div class="side_title">
            <h1>관리자 페이지</h1>
        </div>
        <div class="side_menu">
            <a href="/admin">WebtoonList</a>
            <a href="/adminQnalist">Q&AList</a>
            <a href="/adminNoticelist">NoticeList</a>
        </div>
    </div>
    <div class="admin_view">

        <div class="top">
            <div>${loginAdmin.name}님</div>
            <div>LOGO</div>
        </div>
        <div>총 회원 수 : </div>
        <div>총 웹툰 수 : </div>