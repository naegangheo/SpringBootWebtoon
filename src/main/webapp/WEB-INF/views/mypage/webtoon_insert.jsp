<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CREATE</title>
</head>
<link rel="stylesheet" href="/css/mypage/webtoon_insert.css">
<body>
<div class="header">
    <div class="logo"><img src="images/mypage/insertwebtoonlogo.png"/></div>
    <div class="id"><img src="images/mypage/1.png"/><label>아이디</label></div>
</div>

<div class="container">
    <div><h2>신규 작품 등록</h2></div>
    <div class="rule">
        <br/>
        <div><label>운영원칙</label></div>
        <div>저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시물은 이용약관 및 관련 법률에 의해 제재를 받으실 수 있습니다.
            성인물, 폭력물 등의 게시물은 통보 없이 삭제될 수 있습니다</div>
        <div class="ruleradio"><input type="radio" id="rule" name="rule"/><label>동의합니다</label></div>
        <br/>
    </div>
    <br/>

    <div class="info">
        <br/>
        <div class="subject">
            <div class="sub">작품명</div>
            <div><input type="text" id="title" name="title" placeholder="작품명을 입력해 주세요." maxlength="30" required> </div>
        </div>
        <br/>
        <div class="tag">
            <div class="sub">장르</div>
            <div class="genre">
                <div class="genreradio"><input type="radio" id="genre1" name="genre" value="1" checked/><label>로맨스</label></div>
                <div class="genreradio"><input type="radio" id="genre2" name="genre" value="2"/><label>판타지</label></div>
                <div class="genreradio"><input type="radio" id="genre3" name="genre" value="3"/><label>액션</label></div>
                <div class="genreradio"><input type="radio"  id="genre4" name="genre" value="4"/><label>일상</label></div>
                <div class="genreradio"><input type="radio" id="genre5" name="genre" value="5"/><label>스릴러</label></div>
            </div>
        </div>
        <br/>
        <div class="content">
            <div class="sub">내용</div>
            <div>
                <textarea id="content" name="content" placeholder="작품의 줄거리를 작성해 주세요." maxlength="400" rows="5" ></textarea>
            </div>
        </div>
        <br/>
    </div>

    <br/>

    <div class="images">
        <br/>
        <div class="imginsert">
            <div class="sub"><label>이미지</label></div>
            <div><input type="button" value="대표 이미지 선택" onclick="selectImg1()"/></div>
            <div><input type="button" value="웹툰 이미지 선택" onclick="selectImg2()"/></div>
        </div>
        <br>
        <div class="imgpreview">
            <div class="sub"><label>이미지 미리보기</label></div>
<%--            대표 이미지 미리보기 --%>

<%--            <div style="flex:4">--%>
<%--                <c:choose>--%>
<%--                    <c:when test="${empty dto.savefilename}">--%>
<%--                        <img src=""  id="previewimg" width="150" style="display:none" />--%>
<%--                    </c:when>--%>
<%--                    <c:otherwise>--%>
<%--                        <img src="/upload/${dto.savefilename}"  id="previewimg" width="150" style="display:inline" />--%>
<%--                    </c:otherwise>--%>
<%--                </c:choose>--%>
<%--                <input type="hidden" name="savefilename" value="${dto.savefilename}">--%>
<%--                <input type="hidden" name="image"  value="${dto.image}">--%>
<%--                <div id="image">${dto.image}</div>--%>
<%--                <div id="savefilename">${dto.savefilename}</div>--%>
<%--            </div>--%>

<%--            웹툰 이미지 미리보기 --%>
<%--            <div style="flex:4">--%>
<%--                <c:choose>--%>
<%--                    <c:when test="${empty dto.savefilename}">--%>
<%--                        <img src=""  id="previewimg" width="150" style="display:none" />--%>
<%--                    </c:when>--%>
<%--                    <c:otherwise>--%>
<%--                        <img src="/upload/${dto.savefilename}"  id="previewimg" width="150" style="display:inline" />--%>
<%--                    </c:otherwise>--%>
<%--                </c:choose>--%>
<%--                <input type="hidden" name="savefilename" value="${dto.savefilename}">--%>
<%--                <input type="hidden" name="image"  value="${dto.image}">--%>
<%--                <div id="image">${dto.image}</div>--%>
<%--                <div id="savefilename">${dto.savefilename}</div>--%>
<%--            </div>--%>

        </div>
        <br/>

    </div>
    <br/>


 <div class="bottom_button">
    <button type="submit">제출</button>
    <button type="button" value="돌아가기" onclick="location.href='/'">돌아가기</button>
 </div>
    <br/>

</div>





</body>
</html>
