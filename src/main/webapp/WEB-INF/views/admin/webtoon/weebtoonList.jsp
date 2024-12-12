<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../admin_header.jsp"%>

<div class="admin_view">

    <div class="top">
      <div>## List</div>
      <div>LOGO</div>
    </div>

    <div class="bottom">

        <%--webtoonlist--%>
        <div class="list">
            <div class="title">
                <div class="col">번호</div>
                <div class="col">작가</div>
                <div class="col">제목</div>
                <div class="col">조회수</div>
                <div class="col">등록일</div>
            </div>
            <div class="content">
                <c:forEach items="${List}" var="VO">
                    <div class="title">
                        <div class="col">
                            ${seq}
                        </div>
                        <div class="col">
                            ${userid}
                        </div>
                        <div class="col">
                            ${subject}
                        </div>
                        <div class="col">
                            ${readcountT}
                        </div>
                        <div class="col">
                            <fmt:formatDate value="${indate}" pattern="yyyy-MM-dd"/>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</div>


<%@ include file="../admin_footer.jsp"%>