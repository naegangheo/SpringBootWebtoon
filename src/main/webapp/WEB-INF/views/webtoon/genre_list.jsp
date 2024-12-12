<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" type="text/css" href="css/best.css" />

<div class="main-container">
    <!-- 오늘의 인기 베스트도전 -->
    <section class="today-best">
        <h2>${messageG} 베스트</h2>

        <div class="best-wrapper">
            <c:if test="${empty genreList}">
                <p>조회된 데이터가 없습니다.</p>
            </c:if>
            <c:forEach items="${genreList}" var="wvo" begin="1" end="3">
                <div class="best-item">
                    <a href="webtoon_view?wseq=${wvo.wseq}&gender=${loginUser.gender}">
                        <img src="/images/webtoon/webtoon_images/title_img/${wvo.image}"/>
                    </a>
                    <a href="webtoon_view?wseq=${wvo.wseq}&gender=${loginUser.gender}">
                        ${wvo.subject}
                    </a>
                    <div class="author">
                        <a href="webtoon_view?wseq=${wvo.wseq}&gender=${loginUser.gender}">
                            ${wvo.userid}
                        </a>
                    </div>
                    <div class="views">
                        👁 ${wvo.readcountM+wvo.readcountF+wvo.readcountN}
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>

    <!-- 전체 베스트 -->
    <section class="all-best">
        <div class="best-header">
        <h2>${messageG} 리스트</h2>
        <div class="filters">
            <a href="javascript:void(0);" id="sortWritedate">업데이트순</a>
            <a href="javascript:void(0);" id="sortString">가나다순</a>
            </div>
        </div>
        <div class="best-grid" id="genreList">
            <c:choose>
                <c:when test="${empty selectGenreList}">
                    <p>조회된 데이터가 없습니다.</p>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${selectGenreList}" var="wvo">
                        <div class="grid-item" data-title="${wvo.subject}" data-date="${wvo.indate}">
                            <a href="webtoon_view?wseq=${wvo.wseq}&gender=${loginUser.gender}">
                                <img src="/images/webtoon/webtoon_images/title_img/${wvo.image}" alt="작품 이미지">
                            </a>
                            <div class="content">
                                <p class="title">
                                    <a href="webtoon_view?wseq=${wvo.wseq}&gender=${loginUser.gender}">
                                         ${wvo.subject}
                                    </a>
                                </p>
                                <p class="author">
                                   <a href="webtoon_view?wseq=${wvo.wseq}&gender=${loginUser.gender}">
                                    ${wvo.userid}
                                   </a>
                                </p>
                                <p class="views">
                                    👁 ${wvo.readcountM+wvo.readcountF+wvo.readcountN}
                                </p>
                            </div>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="paging">
            <!-- prev 버튼의 표시 여부 -->
            <c:if test="${paging.prev}" >
                <a href="genreCategory?genre=${genre}&page=${paging.beginPage-1}">◀</a>&nbsp;
            </c:if>
            <p>Genre: ${genre}</p>
            <!--  beginPage 부터  endPage 까지 일렬로 페이지를 표시 -->
            <c:forEach begin="${paging.beginPage}"  end="${paging.endPage}"  var="index">
                <a href="genreCategory?genre=${genre}&page=${index}">
                    &nbsp;${index}&nbsp;
                </a>
            </c:forEach>

            <!-- next 버튼 표시 여부 -->
            <c:if test="${paging.next}" >
                <a href="genreCategory?genre=${genre}&page=${paging.endPage+1}">▶</a>&nbsp;
            </c:if>
        </div>
    </section>
</div>

<%@ include file="../footer.jsp" %>


<script>
    document.getElementById("sortString").addEventListener("click", function() {
        sortList("alphabet");
    });

    document.getElementById("sortWritedate").addEventListener("click", function() {
        sortList("writedate");
    });

    function sortList(type) {
        let genreList = document.getElementById("genreList");
        let items = Array.from(genreList.getElementsByClassName("grid-item"));

        if (type === "alphabet") {
            // 가나다순 정렬
            items.sort((a, b) => {
                let titleA = a.getAttribute("data-title");
                let titleB = b.getAttribute("data-title");
                return titleA.localeCompare(titleB);  // 가나다순
            });
        } else if (type === "writedate") {
            // 등록일순 정렬
            items.sort((a, b) => {
                let dateA = a.getAttribute("data-date");
                let dateB = b.getAttribute("data-date");
                return new Date(dateB) - new Date(dateA);  // 최신순
            });
        }

        // 정렬된 항목들을 DOM에 다시 append
        genreList.innerHTML = "";
        items.forEach(item => genreList.appendChild(item));
    }

</script>
