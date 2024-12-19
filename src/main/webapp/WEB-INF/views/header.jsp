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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="/script/header.js"></script>
    <script type="text/javascript">

    </script>
</head>
<body>
<div class="wrap">
        <header>
            <div id="header">
            <div class="h_left">
                <a href="/">
                    <img src="images/main/logo.png">
                </a>
            </div>

            <div class="h_right">
                <!-- 검색 입력창 -->
                <div class="h_search">
                    <form action="/search" method="get">
                        <input type="text" name="keyword" placeholder="제목/작가로 검색할 수 있습니다."
                               value="${param.keyword != null ? param.keyword : ''}"/>
                        <button type="submit" style="border: none; background-color: transparent; cursor: pointer;">
                            <svg class="svg" width="18" height="18" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M24 24L17.5001 17.5M20 11.5C20 16.1944 16.1944 20 11.5 20C6.80558 20 3 16.1944 3 11.5C3 6.80558 6.80558 3 11.5 3C16.1944 3 20 6.80558 20 11.5Z" stroke="#666" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                        </button>
                    </form>
                </div>

                <!--로그인버튼-->
                <div id="h_login">
                    <c:choose>
                        <c:when test="${empty loginUser}">
                            <a href="login" class="in-out-btn">로그인</a>
                        </c:when>
                        <c:otherwise>
                            <a href="updateMember">${loginUser.name}님&nbsp;</a>
                            <a href="logout" class="in-out-btn" id="logout">logout</a>
                        </c:otherwise>
                    </c:choose>
                </div>

            </div>
            </div>

        </header>
    <div class="nav_areaO">
        <div class="nav_area">
            <nav class="main_category">
                <a href="/" style="text-decoration: none;">Home</a>&nbsp;
                <a href="#" id="category_link" style="text-decoration: none;">Week</a>&nbsp;
                <a href="/best" style="text-decoration: none;">Best</a>&nbsp;
                <a href="/genre" id="genre_link" style="text-decoration: none;">Genre</a>&nbsp;
                <c:choose>
                    <c:when test="${empty loginUser}">
                    <%-- 로그아웃시 :  안 보임 --%>
                    </c:when>
                    <c:otherwise>
                    <%-- 로그인 시 : 보임 --%>
                    <a href="#"  id="mypage_link" style="text-decoration: none;">Mypage</a>
                    </c:otherwise>
                </c:choose>
            </nav>
            </div>
        </div>
        <div class="nav_areaO1">
            <div class="nav_area">
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
        </div>
         <div class="nav_areaO2">
            <div class="nav_area">
            <div id="genre_selector" class="genre_selector">
                <a href="genreCategory?genre=1">전체</a>
                <a href="genreCategory?genre=2">로맨스</a>
                <a href="genreCategory?genre=3">판타지</a>
                <a href="genreCategory?genre=4">액션</a>
                <a href="genreCategory?genre=5">일상</a>
                <a href="genreCategory?genre=6">스릴러</a>
            </div>
            </div>
         </div>
        <div class="nav_areaO3">
            <div class="nav_area">
                <div id="mypage_selector" class="mypage_selector">
                    <a href="/updateMember" >회원탈퇴/수정</a>
                    <a href="created"  style="text-decoration: none;">게시물 등록</a>
                    <a href="myQna"  style="text-decoration: none;">Q&A</a>
                </div>
            </div>
        </div>



<script>
    document.getElementById('logout').addEventListener('click', function (event) {
        event.preventDefault();


        const confirmLogout = confirm('정말 로그아웃 하시겠습니까?');
        if (confirmLogout) {
            window.location.href = '/logout';
        }
    });
</script>