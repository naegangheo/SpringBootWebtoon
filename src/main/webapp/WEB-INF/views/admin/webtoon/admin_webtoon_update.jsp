<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ include file="../admin_header.jsp"%>
<link rel="stylesheet" href="/admin/css/webtoon_update.css">
<script src="admin/script/webtoon_update.js"></script>
<style>
    .top_menu a:nth-child(1){
        opacity: 1;
        background-color: rgb(222, 246, 222);
    }
</style>
<div class="container">

    <form method="POST" action="updateWebtoon" enctype="multipart/form-data" onsubmit="return advalidateForm()"  novalidate>
        <input type="hidden" id="wseq" value="${webtoon.wseq}">
        <h2>작품 수정</h2>
        <div class="updateinfo">

            <div class="subject">
                <div class="sub">작품명</div>
                <div class="text-container">
                    <input type="text" id="subject" name="subject" value="${webtoon.subject}"
                           placeholder="작품명을 입력해 주세요." maxlength="30" required
                           oninput="updateCounter('subject', 'subjectCounter')">
                    <div class="maxlength-counter" id="subjectCounter">0/30</div>
                </div>
            </div>

            <div class="genre">
                <div class="sub">장르</div>
                <label><input type="radio" name="genre" value="2" <c:if test="${webtoon.genre == 2}">checked</c:if>> 로맨스</label>
                <label><input type="radio" name="genre" value="3" <c:if test="${webtoon.genre == 3}">checked</c:if>> 판타지</label>
                <label><input type="radio" name="genre" value="4" <c:if test="${webtoon.genre == 4}">checked</c:if>> 액션</label>
                <label><input type="radio" name="genre" value="5" <c:if test="${webtoon.genre == 5}">checked</c:if>> 일상</label>
                <label><input type="radio" name="genre" value="6" <c:if test="${webtoon.genre == 6}">checked</c:if>> 스릴러</label>
            </div>

            <div class="week">
                <div class="sub">요일</div>
                <label><input type="radio" name="week" value="1" <c:if test="${webtoon.week == 1}">checked</c:if>> 월</label>
                <label><input type="radio" name="week" value="2" <c:if test="${webtoon.week == 2}">checked</c:if>> 화</label>
                <label><input type="radio" name="week" value="3" <c:if test="${webtoon.week == 3}">checked</c:if>> 수</label>
                <label><input type="radio" name="week" value="4" <c:if test="${webtoon.week == 4}">checked</c:if>> 목</label>
                <label><input type="radio" name="week" value="5" <c:if test="${webtoon.week == 5}">checked</c:if>> 금</label>
                <label><input type="radio" name="week" value="6" <c:if test="${webtoon.week == 6}">checked</c:if>> 토</label>
                <label><input type="radio" name="week" value="7" <c:if test="${webtoon.week == 7}">checked</c:if>> 일</label>
            </div>
        </div>

        <div class="content">
            <div class="sub">내용</div>
            <div class="text-container">
                <textarea id="content" name="content" placeholder="작품의 줄거리를 작성해 주세요."
                          maxlength="400" rows="5"  required
                          oninput="updateCounter('content', 'contentCounter')">${webtoon.content}</textarea>
                <div class="maxlength-counter" id="contentCounter">0/400</div>
            </div>
        </div>
    </form>

    <form method="POST" action="fileup" enctype="multipart/form-data">

        <div class="images">
            <!-- 대표 이미지 -->
            <div class="sub">대표 이미지</div>
            <label>
                <input type="file" id="mainImage" name="mainImage" style ="display: none;" onchange="adpreviewImage(event, 'mainImagePreview')">
                <button type="button" onclick="adtriggerFileInput('mainImage')">대표 이미지 선택</button>
            </label>
            <!-- 웹툰 이미지 -->
            <div class="sub">웹툰 이미지</div>
            <label>
                <input type="file" id="contentImage" name="contentImage" style="display: none;" onchange="adpreviewImage(event, 'contentImagePreview')">
                <button type="button" onclick="adtriggerFileInput('contentImage')">웹툰 이미지 선택</button>
            </label>
        </div>
        <!-- 이미지 미리보기 -->
        <div class="imgPreview">
            <div class="sub">이미지 미리보기</div>
            <img id="mainImagePreview" src="/images/webtoon/webtoon_images/title_img/${webtoon.image}" alt="대표 이미지 미리보기" style="width: 150px; height: 150px; display: inline;">
            <img id="contentImagePreview" src="/images/webtoon/webtoon_images/content_img/${webtoon.image2}" alt="웹툰 이미지 미리보기" style="width: 150px; height: 150px; display: inline;">
        </div>
        <div class="bottom_button">
            <button type="submit">웹툰 저장</button>
            <button type="button" value="돌아가기" onclick="location.href='/admin'">돌아가기</button>
        </div>
    </form>
</div>
</div>
</div>

<%@ include file="../admin_footer.jsp"%>