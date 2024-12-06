<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>header</title>


    <link rel="stylesheet" href="/css/Header_footer.css">
    <script src="/script/jquery-3.7.1.min.js"></script>
    <script src="/script/header.js"></script>
    <script type="text/javascript">

    </script>
</head>
<body>
    <div class="wrap">
        <header>
            <div class="h_left">
                <a href="/">
                    <img src="/images/logo.png">
                </a>
            </div>
            <div class="h_right">
                <div class="h_search">
                    <input type="text" placeholder="검색"/>
                    <div>
                        <a href="#">
                            <img src="/images/search.png">
                        </a>
                    </div>
                </div>
                <div id="h_login">
                    <c:choose>
                        <c:when test="${empty loginUser}">
                            <a href="login" class="in-out-btn">login</a>
                        </c:when>
                        <c:otherwise>
                            <a href="#">${loginUser.name}님&nbsp;</a>
                            <a href="logout" class="in-out-btn">logout</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </header>
        <div class="nav_area">
            <nav class="main_category">
                <a href="/">Home</a>&nbsp;
                <a href="#" id="category_link">Category</a>&nbsp;
                <a href="/best">Best</a>&nbsp;
                <a href="#">Genre</a>&nbsp;
                <c:choose>
                    <c:when test="${empty loginUser}"> <%-- 로그아웃시 :  안 보임 --%>
                        <a href="/mypage">Mypage</a>
                   </c:when>
                   <c:otherwise>    <%-- 로그인 시 : 보임 --%>
                        <a href="/mypage">Mypage</a>
                    </c:otherwise>
                </c:choose>
            </nav>
            <div id="week_selector" class="week_selector">
                <a href="/week?week=0">요일전체</a>
                <a href="/week?week=1">월</a>
                <a href="/week?week=2">화</a>
                <a href="/week?week=3">수</a>
                <a href="/week?week=4">목</a>
                <a href="/week?week=5">금</a>
                <a href="/week?week=6">토</a>
                <a href="/week?week=7">일</a>
            </div>

        </div>

