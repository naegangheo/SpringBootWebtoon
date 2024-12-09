<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" type="text/css" href="css/webtoon/week_list.css" />

<div class="main-container">
    <!-- 오늘의 인기 베스트도전 -->
    <section class="today-best" >
        <h2>${weekend} 인기 베스트</h2>
        <div class="best-wrapper">
            <c:forEach items="${week}" var="week" begin="0" end="2">
                <div class="best-item">
                  <a href="webtoonview?wseq=${week.wseq}">
                    <img src="/images/main/noname.jpg"/>
                  </a>
                  <a href="webtoonview?wseq=${week.wseq}">
                    ${week.subject}
                  </a>
                  <div class="author">
                      <a href="webtoonview?wseq=${week.wseq}">
                        ${week.userid}
                      </a>
                  </div>
                  <div class="views">
                    👁 ${week.readcountM+week.readcountF+week.readcountN}
                  </div>
                </div>
          </c:forEach>

        </div>
    </section>

    <!-- 전체 베스트 -->
    <section class="all-best">
        <div class="best-header">
        <h2>${weekend} 전체 베스트</h2>
        <div class="filters">
            <a href="javascript:void(0);" id="sortString">가나다순</a>
            <a href="javascript:void(0);" id="sortWritedate">업데이트순</a>
            </div>
        </div>
        <div class="best-grid" id="week">
            <c:forEach items="${week}" var="week">
                <div class="grid-item" data-title="${week.subject}" data-date="${week.indate}">
                    <a href="webtoonview?wseq=${week.wseq}">
                        <img src="/images/main/noname.jpg" alt="작품 이미지">
                    </a>
                    <div class="content">
                        <p class="title"><a href="webtoonview?wseq=${week.wseq}">작품 제목 ${week.subject}</a></p>
                        <p class="author"><a href="webtoonview?wseq=${week.wseq}">작가 이름 ${week.userid}</a></p>
                        <p class="views">👁${week.readcountF+week.readcountM+week.readcountN}</p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>
</div>

<%@ include file="../footer.jsp" %>

<script>

    document.getElementById("sortString").addEventListener("click",function (){ sortList("alphabet");});

    document.getElementById("sortWritedate").addEventListener("click",function (){sortList("writedate");
    });

    function sortList(type){
        let week = document.getElementById("week");
        let items = Array.from(week.getElementsByClassName("grid-item"));

        if(type ==="alphabet"){
            items.sort((a,b) =>{
                let titleA = a.getAttribute("data-title");
                let titleB = b.getAttribute("data-title");
                return titleA.localeCompare(titleB);
            });
        }else if(type === "writedate"){
            items.sort((a,b)=>{
                let dateA = a.getAttribute("data-date");
                let dateB = b.getAttribute("data-date");
                return new Date(dateB) - new Date(dateA);
            });
        }

        week.innerHTML = "";
        items.forEach(item => week.appendChild(item));
    }
</script>